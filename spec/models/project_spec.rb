require 'rails_helper'
require 'project'

describe Project do
  it { expect(Project.reflect_on_association(:user).macro).to eq(:belongs_to) }
  it { expect(Project.reflect_on_association(:klasses).macro).to  eq(:has_many) }
  it { expect(Project.reflect_on_association(:tasks).macro).to eq(:has_many) }

  before :each do
    @user = User.create(email: "bla@bla.com", password: "blablabla")
    @project = Project.new(name: "Project1", display_tasks: false, user: @user)
  end

  subject { @project } 

  it { should respond_to :name }
  it { should respond_to :user_id } 
  it { should respond_to :guid } 
  it { should respond_to :display_tasks } 
  
  describe "Validation" do
    describe "should not validate when there is no name" do
      before { @project.name = '' }
      it { should_not be_valid }
    end

    describe "should not validate when name is below 3 characters" do
      before { @project.name = 'aa'}
      it { should_not be_valid }
    end

    describe "should not validate when name is above 30 characters" do
      before { @project.name = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz' }
      it { should_not be_valid }
    end

    describe "should not validate when not linked to a user" do
      before { @project.user_id = nil }
      it { should_not be_valid }
    end
  end

  describe :get_total_result_set do

  end

  describe "before create" do
    describe "guid" do
      it "should add a guid" do
        project2 = Project.new(name: "Project2", display_tasks: true, user: @user)
        expect(project2.guid).to be_nil
        project2.save!
        expect(project2.guid).to be_present
      end

      it "should be unique" do
        project1 = Project.create(name: "Project1", display_tasks: true, user: @user)
        project2 = Project.create(name: "Project2", display_tasks: true, user: @user)
        project3 = Project.create(name: "Project3", display_tasks: true, user: @user)
        project4 = Project.create(name: "Project4", display_tasks: true, user: @user)

        expect(project1.guid).not_to eq(project2.guid)
        expect(project1.guid).not_to eq(project3.guid)
        expect(project1.guid).not_to eq(project4.guid)

        expect(project2.guid).not_to eq(project3.guid)
        expect(project2.guid).not_to eq(project4.guid)

        expect(project3.guid).not_to eq(project4.guid)
      end
    end

   
  end


  describe "setting tasks dispaly boolean" do
    describe :set_tasks_to_visible do
      it "should set the display task boolean to visible" do
        @project.display_tasks = false
        @project.save
        expect(@project.display_tasks).to be false
        @project.set_tasks_to_visible
        expect(@project.display_tasks).to be true
      end
    end

    describe :set_tasks_to_hidden do
      it "should set the dispaly task boolean to false" do
        @project.display_tasks = true 
        @project.save
        expect(@project.display_tasks).to be true
        @project.set_tasks_to_hidden
        expect(@project.display_tasks).to be false
      end
    end
  end
end

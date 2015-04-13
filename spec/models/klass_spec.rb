require 'rails_helper'
require 'klass'

describe Klass do

  it { expect(Klass.reflect_on_association(:project).macro).to eq(:belongs_to) }
  it { expect(Klass.reflect_on_association(:methoods).macro).to  eq(:has_many) }
  it { expect(Klass.reflect_on_association(:klass_result_sets).macro).to eq(:has_many) }

  before :each do
    @user = User.create(email: "bla@bla.com", password: "blablabla")
    @project = Project.new(name: "Project1", display_tasks: false, user: @user)
    @klass = Klass.new(name: "Klass1", package: "default", project: @project, is_total: false, display_tasks: true)
  end

  subject { @klass } 

  it { should respond_to :name }
  it { should respond_to :package } 
  it { should respond_to :project } 
  it { should respond_to :display_tasks } 
  it { should respond_to :is_total } 

  describe "Validation" do
    describe "should not validate when there is no name" do
      before { @klass.name = '' }
      it { should_not be_valid }
    end

    describe "should not validate when not linked to a project" do
      before { @klass.project =  nil}
      it { should_not be_valid }
    end
  end

  describe "setting tasks dispaly boolean" do
    describe :set_tasks_to_visible do
      it "should set the display task boolean to visible" do
        @klass.display_tasks = false
        @klass.save
        expect(@klass.display_tasks).to be false
        @klass.set_tasks_to_visible
        expect(@klass.display_tasks).to be true
      end
    end

    describe :set_tasks_to_hidden do
      it "should set the dispaly task boolean to false" do
        @klass.display_tasks = true 
        @klass.save
        expect(@klass.display_tasks).to be true
        @klass.set_tasks_to_hidden
        expect(@klass.display_tasks).to be false
      end
    end
  end
end

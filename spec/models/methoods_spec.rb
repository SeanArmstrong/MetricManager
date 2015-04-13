require 'rails_helper'
require 'methood'

describe Methood do
  it { expect(Methood.reflect_on_association(:klass).macro).to eq(:belongs_to) }
  it { expect(Methood.reflect_on_association(:method_result_sets).macro).to  eq(:has_many) }

  before :each do
    @user = User.create(email: "bla@bla.com", password: "blablabla")
    @project = Project.new(name: "Project1", display_tasks: false, user: @user)
    @klass = Klass.new(name: "Klass1", package: "default", project: @project, is_total: false, display_tasks: true)
    @methood = Methood.new(name: "Method1", klass: @klass, display_tasks: false)
  end

  subject { @methood } 

  it { should respond_to :name }
  it { should respond_to :klass } 
  it { should respond_to :display_tasks } 
  it { should respond_to :return_type } 


  describe "Validation" do
    describe "should not validate when there is no name" do
      before { @methood.name = '' }
      it { should_not be_valid }
    end

    describe "should not validate when not linked to a klass" do
      before { @methood.klass =  nil}
      it { should_not be_valid }
    end
  end

  describe "setting tasks dispaly boolean" do
    describe :set_tasks_to_visible do
      it "should set the display task boolean to visible" do
        @methood.display_tasks = false
        @methood.save
        expect(@methood.display_tasks).to be false
        @methood.set_tasks_to_visible
        expect(@methood.display_tasks).to be true
      end
    end

    describe :set_tasks_to_hidden do
      it "should set the dispaly task boolean to false" do
        @methood.display_tasks = true 
        @methood.save
        expect(@methood.display_tasks).to be true
        @methood.set_tasks_to_hidden
        expect(@methood.display_tasks).to be false
      end
    end
  end
end

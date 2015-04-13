require 'rails_helper'
require 'task'

describe Task do
  it { expect(Task.reflect_on_association(:project).macro).to eq(:belongs_to) }


  before :each do
    @user = User.create(email: "bla@bla.com", password: "blablabla")
    @project = Project.new(name: "Project1", display_tasks: false, user: @user)
    @task = Task.new(name: "Task1",
                    description: "blablabla",
                    complete: false,
                    project: @project,
                    due_date: 3.weeks.from_now,
                    completed_at: nil,
                    start_date: 2.days.ago,
                    visible_on_graphs: true)
  end

  subject { @task } 

  it { should respond_to :name }
  it { should respond_to :description} 
  it { should respond_to :complete } 
  it { should respond_to :project }
  it { should respond_to :due_date}
  it { should respond_to :completed_at } 
  it { should respond_to :start_date } 
  it { should respond_to :visible_on_graphs }

  describe "Validation" do
    describe "Name" do
      describe "when there is no name" do
        before { @task.name = '' }
        it { should_not be_valid }
      end

      describe "when name is below 3 characters" do
        before { @task.name = 'aa'}
        it { should_not be_valid }
      end

      describe "when name is above 20 characters" do
        before { @task.name = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz' }
        it { should_not be_valid }
      end
    end

    describe "when there is no linked project" do
      before { @task.project = nil }
      it { should_not be_valid }
    end

    describe "when description is too long" do
      before { @task.description = 'a' * 101 }
      it { should_not be_valid }
    end

    describe "when there is no due_date" do
      before { @task.due_date = nil }
      it { should_not be_valid }
    end

    describe "when there is no start_date" do
      before { @task.start_date = nil }
      it { should_not be_valid }
    end

    describe "completeness" do
      it "should validate completed_at when task is complete" do
        @task.complete = true
        @task.completed_at = nil
        @task.save
        expect(@task).not_to be_valid
        @task.completed_at = Date.today
        @task.save
        expect(@task).to be_valid
      end
      it "should not validate completed_at when task is not complete" do
        @task.complete = false
        @task.completed_at = nil
        @task.save
        expect(@task).to be_valid
      end
    end
  end


  describe "complete methods" do
    describe :set_to_completed do
      before :each do
        @task.complete = false
        @task.completed_at = nil
        @task.save 
      end
      it "should set complete to true and set completed at time to today" do
        @task.set_to_completed
        expect(@task.complete).to be true
        expect(@task.completed_at).to eq(Date.today)
      end
    end
    describe :set_to_uncompleted do
      before :each do
        @task.complete = true
        @task.completed_at = 2.days.ago
        @task.save 
      end
      it "should set complete to true and set completed at time to today" do
        @task.set_to_uncompleted
        expect(@task.complete).to be false 
        expect(@task.completed_at).to be_nil 
      end
    end
  end

  describe "display methods" do
    describe :set_to_hidden do
      before :each do
        @task.visible_on_graphs = true
        @task.save
      end
      it "should set visible on graphs to false" do
        @task.set_to_hidden
        expect(@task.visible_on_graphs).to be false 
      end
    end
    describe :set_to_display do
      before :each do
        @task.visible_on_graphs = false
        @task.save
      end
      it "should set visible on graphs to false" do
        @task.set_to_display
        expect(@task.visible_on_graphs).to be true 
      end
    end
  end
end

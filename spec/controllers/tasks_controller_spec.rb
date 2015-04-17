require 'rails_helper'
require 'tasks_controller'
require 'controller_helpers'

describe TasksController do

  before :each do
    @user1 = User.create(email: "bla@bla.com", password: "blablabla")
    @user2 = User.create(email: "bla2@bla2.com", password: "blablabla2")
    @project1 = Project.create(name: "Project1", display_tasks: false, user: @user1)
    @project2 = Project.create(name: "Project2", display_tasks: false, user: @user2)
    @task1 = Task.create(name: "Task1",
                    description: "blablabla",
                    complete: false,
                    project: @project1,
                    due_date: 3.weeks.from_now,
                    completed_at: nil,
                    start_date: 2.days.ago,
                    visible_on_graphs: true)
    @task2 = Task.create(name: "Task2",
                    description: "bla2bla2bla2",
                    complete: true,
                    project: @project2,
                    due_date: 3.weeks.from_now,
                    completed_at: Date.today,
                    start_date: 2.days.ago,
                    visible_on_graphs: true)

    sign_in @user1
  end

  describe "GET #index" do
    before :each do
      get :index, project_id: @project1.id
    end
    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the tasks index page" do
      expect(response).to render_template("index")
    end

    it "loads all of the tasks for that project" do
      expect(assigns(:tasks)).to match_array([@task1])
    end
  end

  describe "GET #show" do
    before :each do
      get :show, id: @task1, project_id: @project1.id
    end

    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the project show page" do
      expect(response).to render_template("show")
    end

    describe "task" do
      describe "belongs to project" do
        it "loads the given task by id" do
          expect(assigns(:task)).to eq(@task1) 
        end
      end

      describe "doesn't belong to project" do
        before :each do
          get :show, project_id: @project1.id, id: @task2
        end

        it "redirects to project page" do
          expect(response.code).to eq("302")
          expect(response).to redirect_to project_path(@project1)
        end
      end
    end
  end

  describe "GET #new" do
    before :each do
      get :new, project_id: @project1
    end

    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the project new page" do
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    before :each do
      get :edit, id: @task1, project_id: @project1.id
    end

    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the project edit page" do
      expect(response).to render_template("edit")
    end

    describe "task" do
      describe "belongs to project" do
        it "loads the given task by id" do
          expect(assigns(:task)).to eq(@task1) 
        end
      end

      describe "doesn't belong to project" do
        before :each do
          get :show, project_id: @project1.id, id: @task2
        end

        it "redirects to project page" do
          expect(response.code).to eq("302")
          expect(response).to redirect_to project_path(@project1)
        end
      end
    end
  end
  describe "Post #create" do
    describe "with valid params" do
      before :each do
        post :create, project_id: @project1, task: { name: "Task3",
                    description: "blablabla",
                    complete: false,
                    due_date: 3.weeks.from_now,
                    completed_at: nil,
                    start_date: 2.days.ago,
                    visible_on_graphs: true }
      end

      it "responds with 302 response code and redirects to project path" do
        expect(response.code).to eq("302")
        expect(flash[:success]).to be_present 
        expect(response).to redirect_to project_task_path(@project1, assigns(:task))
      end
    end

    describe "with invalid params" do
      before :each do
        post :create, project_id: @project1, task: { name: "b" }
      end

      it "renders new template with error message" do
        expect(response).to render_template("new") 
        expect(assigns(:task).errors).not_to be_empty
      end
    end
  end

  describe "Post #update" do
    describe "with valid params" do
      before :each do
        patch :update, project_id: @project1.id, id: @task1.id, task: { name: "Task3",
                    description: "blablabla",
                    complete: false,
                    due_date: 3.weeks.from_now,
                    completed_at: nil,
                    start_date: 2.days.ago,
                    visible_on_graphs: true }
      end

      it "responds with 302 response code and redirects to project path" do
        expect(response.code).to eq("302")
        expect(flash[:notice]).to be_present 
        expect(response).to redirect_to project_task_path(@project1, assigns(:task))
      end
    end
    describe "with invalid params" do
      before :each do
        patch :update, project_id: @project1, id: @task1.id, task: { name: "b" }
      end

      it "rendered edit template with errors" do
        expect(response).to render_template("edit") 
        expect(assigns(:task).errors).not_to be_empty
      end
    end
  end
end

require 'rails_helper'
require 'projects_controller'
require 'controller_helpers'

describe ProjectsController do

  before :each do
    @user1 = User.create(email: "bla@bla.com", password: "blablabla")
    @user2 = User.create(email: "bla2@bla2.com", password: "blablabla2")
    @project1 = Project.create(name: "Project1", display_tasks: false, user: @user1)
    @project2 = Project.create(name: "Project2", display_tasks: false, user: @user1)
    @project3 = Project.create(name: "Project3", display_tasks: false, user: @user2)

    sign_in @user1
  end

  describe "GET #index" do
    before :each do
      get :index
    end
    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the project index page" do
      expect(response).to render_template("index")
    end

    it "loads all of the projects for that user" do
      expect(assigns(:projects)).to match_array([@project1, @project2])
    end
  end

  describe "GET #show" do
    before :each do
      get :show, id: @project1.id
    end

    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the project show page" do
      expect(response).to render_template("show")
    end

    describe "project" do
      describe "belongs to user" do
        it "loads the given project by id" do
          expect(assigns(:project)).to eq(@project1) 
        end
      end

      describe "doesn't belong to user" do
        before :each do
          get :show, id: @project3.id
        end

        it "redirects to home page" do
          expect(response.code).to eq("302")
          expect(response).to redirect_to("/")
        end

        it "displays flash message" do
          expect(flash[:notice]).to be_present
        end
      end
    end
  end

  describe "GET #new" do
    before :each do
      get :new
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
      get :edit, id: @project1.id
    end

    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the project edit page" do
      expect(response).to render_template("edit")
    end

    describe "project" do
      describe "belongs to user" do
        it "loads the given project by id" do
          expect(assigns(:project)).to eq(@project1) 
        end
      end

      describe "doesn't belong to user" do
        before :each do
          get :show, id: @project3.id
        end

        it "redirects to home page" do
          expect(response.code).to eq("302")
          expect(response).to redirect_to("/")
        end

        it "displays flash message" do
          expect(flash[:notice]).to be_present
        end
      end
    end
  end

  describe "Post #create" do
    describe "with valid params" do
      before :each do
        post :create, project: { name: "ProjectTest", display_tasks: true }
      end

      it "responds with 302 response code and redirects to project path" do
        expect(response.code).to eq("302")
        expect(flash[:success]).to be_present 
        expect(response).to redirect_to project_path(assigns(:project))
      end
    end
    describe "with invalid params" do
      before :each do
        post :create, project: { display_tasks: true }
      end

      it "renders new template with error message" do
        expect(response).to render_template("new") 
        expect(flash[:error]).to be_present 
      end
    end
  end

  describe "Post #update" do
    describe "with valid params" do
      before :each do
        patch :update, id: @project1.id, project: { name: "ProjectTest", display_tasks: true }
      end

      it "responds with 302 response code and redirects to project path" do
        expect(response.code).to eq("302")
        expect(flash[:success]).to be_present 
        expect(response).to redirect_to project_path(assigns(:project))
      end
    end
    describe "with invalid params" do
      before :each do
        patch :update, id: @project1.id, project: { name: "a", display_tasks: true }
      end

      it "rendered edit template with errors" do
        expect(response).to render_template("edit") 
        expect(flash[:error]).to be_present 
      end
    end
  end
end

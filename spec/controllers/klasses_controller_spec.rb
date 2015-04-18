require 'rails_helper'
require 'klasses_controller'
require 'controller_helpers'

describe KlassesController do

  before :each do
    @user1 = User.create(email: "bla@bla.com", password: "blablabla")
    @user2 = User.create(email: "bla2@bla2.com", password: "blablabla2")
    @project1 = Project.create(name: "Project1", display_tasks: false, user: @user1)
    @project2 = Project.create(name: "Project2", display_tasks: false, user: @user2)
    @klass1 = Klass.create(name: "Klass1", package: "default", project: @project1, is_total: false, display_tasks: true)
    @klass2 = Klass.create(name: "Klass2", package: "default", project: @project1, is_total: false, display_tasks: true)
    @klass3 = Klass.create(name: "Klass3", package: "default", project: @project2, is_total: false, display_tasks: true)


    sign_in @user1
  end

  describe "GET #index" do
    before :each do
      get :index, pid: @project1
    end
    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the klasses index page" do
      expect(response).to render_template("index")
    end

    it "loads all of the klasses for that project" do
      expect(assigns(:klasses)).to match_array([@klass1, @klass2])
    end
  end

  describe "GET #show" do
    before :each do
      get :show, pid: @project1.id, kid: @klass1.id
    end

    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the klass show page" do
      expect(response).to render_template("show")
    end

    describe "klass" do
      describe "belongs to project" do
        it "loads the given klass by id" do
          expect(assigns(:klass)).to eq(@klass1) 
        end
      end

      describe "doesn't belong to project" do
        before :each do
          get :show, pid: @project1, kid: @klass3.id
        end

        it "redirects to projects page" do
          expect(response.code).to eq("302")
          expect(response).to redirect_to project_path(@project1)
        end
      end
    end
  end

  describe "GET #new" do
  # no route
  end
end

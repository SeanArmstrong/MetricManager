require 'rails_helper'
require 'methoods_controller'
require 'controller_helpers'

describe MethoodsController do

  before :each do
    @user1 = User.create(email: "bla@bla.com", password: "blablabla")
    @project1 = Project.create(name: "Project1", display_tasks: false, user: @user1)
    @klass1 = Klass.create(name: "Klass1", package: "default", project: @project1, is_total: false, display_tasks: true)
    @klass2 = Klass.create(name: "Klass2", package: "default", project: @project2, is_total: false, display_tasks: true)
    @methood1 = Methood.create(name: "Method1", klass: @klass1)
    @methood2 = Methood.create(name: "Method1", klass: @klass1)
    @methood3 = Methood.create(name: "Method1", klass: @klass2)

    sign_in @user1
  end

  describe "GET #index" do
    before :each do
      get :index, pid: @project1, kid: @klass1
    end
    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the methoods index page" do
      expect(response).to render_template("index")
    end

    it "loads all of the methoods for that klass" do
      expect(assigns(:methoods)).to match_array([@methood1, @methood2])
    end
  end

  describe "GET #show" do
    before :each do
      get :show, pid: @project1.id, kid: @klass1.id, mid: @methood1
    end

    it "responds with 200 response code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the methoods show page" do
      expect(response).to render_template("show")
    end

    describe "methood" do
      describe "belongs to klass" do
        it "loads the given klass by id" do
          expect(assigns(:methood)).to eq(@methood1) 
        end
      end

      describe "doesn't belong to project" do
        before :each do
          get :show, pid: @project1, kid: @klass1.id, mid: @methood3
        end

        it "redirects to projects page" do
          expect(response.code).to eq("302")
          expect(response).to redirect_to root_path
        end
      end
    end
  end

  describe "GET #new" do
  # no route
  end
end

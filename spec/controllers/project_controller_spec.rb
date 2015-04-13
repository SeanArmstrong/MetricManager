require 'rails_helper'
require 'projects_controller'

describe ProjectsController do

  before :each do
    @user1 = User.create(email: "bla@bla.com", password: "blablabla")
    @user2 = User.create(email: "bla2@bla2.com", password: "blablabla2")
    @project1 = Project.new(name: "Project1", display_tasks: false, user: @user1)
    @project2 = Project.new(name: "Project2", display_tasks: false, user: @user1)
    @project3 = Project.new(name: "Project3", display_tasks: false, user: @user2)

    current_user = @user1
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

  describe "show" do

  end

end

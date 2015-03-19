module API::V1
  class Projects < Grape::API
    format 'json'

    resource :projects do
      desc "Return list of users"
      get '/' do
        Project.all
      end


      desc "Post a new project"
      params do
        requires :name, type: String
      end
      post '/' do
        Project.create(name: params[:name], user_id: 1)
      end
    end
  end
end

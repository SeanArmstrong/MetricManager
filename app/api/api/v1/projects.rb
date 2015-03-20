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
        requires :email, type: String
        requires :password, type: String
      end
      post '/' do
        u = User.authenticate(params[:email], params[:password])
        if !u.nil?
            Project.create(name: params[:name], user_id: u.id) 
        end
      end
    end
  end
end

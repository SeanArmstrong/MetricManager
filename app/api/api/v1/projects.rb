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

    resource :getprojectguid do
    desc "get a project via name and user"
      params do
        requires :name, type: String
        requires :email, type: String
        requires :password, type: String
      end
      get '/' do
        u = User.authenticate(params[:email], params[:password])
        if !u.nil?
          p = u.projects(name: params[:name])
          if !p.nil?
            return p.guid
          end
        end  
      end
    end

    resource :getprojectbyname do
    desc "get a project via name and user"
      params do
        requires :name, type: String
        requires :email, type: String
        requires :password, type: String
      end
      get '/' do
        u = User.authenticate(params[:email], params[:password])
        if !u.nil?
          return u.projects(name: params[:name])
        end  
      end
    end
  end
end

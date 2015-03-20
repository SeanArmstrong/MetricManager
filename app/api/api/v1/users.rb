module API::V1
  class Users < Grape::API
    format 'json'

    resource :users do
      desc "Return list of users"
      get '/' do
        User.all
      end

      desc "check for valid user"
      params do
        requires :email, type: String
        requires :password, type: String
      end
      get '/' do
        u = User.authenticate(params[:email], params[:password])  
        return true if !u.nil?
        return false
      end
    end
  end
end

module API::V1
  class Klasses < Grape::API
    format 'json'

    resource :klasses do
      desc "Return list of users"
      get '/' do
        Klass.all
      end


      desc "Post a new Klass"
      params do
        requires :name, type: String
      end
      post '/' do
        Klass.create(name: params[:name], project_id: 1)
      end
    end
  end
end


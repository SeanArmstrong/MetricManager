module API::V1
  class Methoods < Grape::API
    format 'json'

    resource :methoods do

      desc "Post a new result set for method"
      params do
        requires :email, type: String
        requires :password, type: String
        requires :project_guid, type: String

        requires :name, type: String
        requires :return_type, type: String
        requires :klass_id, type: Integer

        requires :number_of_lines, type: Integer
        requires :complexity, type: Integer
      end
      post '/' do
        u = User.authenticate(params[:email], params[:password])
        if !u.nil?
          p = u.projects(guid: params[:guid]).first 
          if !p.nil?
            k = p.klasses(id: params[:klass_id]).first  
            if !k.nil?
              # need to resolve methods same name differnet params
              m = k.methods(name: params[:name]).first
              if m.nil
                m = Methood.create(name: params[:name], return_type: params[:return_type],
                                klass_id: params[:klass_id])
              end
              MethodResultSet.create(method_id: m.id, number_of_lines: params[:number_of_lines], complexity: params[:complexity])
            end
          end
        end
      end
    end
  end
end

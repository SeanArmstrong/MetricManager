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
        optional :return_type, type: String
        requires :klass_id, type: Integer

        requires :number_of_lines, type: Integer
        requires :complexity, type: Integer

        requires :upload_guid, type: String
      end
      post '/' do
        u = User.authenticate(params[:email], params[:password])
        if !u.nil?
          p = u.projects.find_by(guid: params[:project_guid])
          if !p.nil?
            k = p.klasses.find_by(id: params[:klass_id])
            if !k.nil?
              # need to resolve methods same name differnet params
              m = k.methoods.find_by(name: params[:name])
              if m.nil?
                m = Methood.create(name: params[:name], klass_id: k.id)
              end
              MethodResultSet.create(methood_id: m.id,
                                      number_of_lines: params[:number_of_lines],
                                      complexity: params[:complexity],
                                      upload_guid: params[:upload_guid])
            else
              "Can't Find Klass"
            end
          else
            "Can't Find Project"
          end
        else
          "Can't Find User"
        end
      end
    end
  end
end

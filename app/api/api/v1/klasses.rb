module API::V1
  class Klasses < Grape::API
    format 'json'

    resource :klasses do

      desc "Get class id"
      params do
        requires :email, type: String
        requires :password, type: String
        requires :project_guid, type: String
        requires :name, type: String
      end
      get '/' do
        u = User.authenticate(params[:email], params[:password])
        if !u.nil?
          p = u.projects.find_by(guid: params[:project_guid])
          if !p.nil?
            return p.klasses.find_by(name: params[:name]).id  
          end
        end
      end

      desc "Post a new result set for class"
      params do
        requires :email, type: String
        requires :password, type: String
        requires :project_guid, type: String

        requires :name, type: String
        requires :package, type: String
        requires :variables, type: Integer
        requires :public_variables, type: Integer
        requires :protected_variables , type: Integer
        requires :private_variables , type: Integer
        requires :number_of_lines, type: Integer
        requires :number_of_methods, type: Integer

        requires :average_lines_per_method, type: Float 
        requires :average_method_complexity, type: Float 
        requires :weighted_methods_per_class, type: Float 
        requires :depth_of_inheritance, type: Integer 
        requires :lcom, type: Float 
        requires :cbo, type: Float 
        requires :sdmc, type: Float

        requires :upload_guid, type: String
        requires :is_total, type: Boolean
      end
      post '/' do
        u = User.authenticate(params[:email], params[:password])
        if !u.nil?
          p = u.projects.find_by(guid: params[:project_guid])
          if !p.nil?
            k = p.klasses.find_by(name: params[:name])
            if k.nil?
              k = Klass.create(name: params[:name], package: params[:package], project_id: p.id, is_total: params[:is_total])
            end

            rsg = ResultSetGroup.find_by(upload_guid: params[:upload_guid])
            if rsg.nil?
              rsg = ResultSetGroup.create(upload_guid: params[:upload_guid])
            end

            KlassResultSet.create(
                        klass_id: k.id,
                        variables: params[:variables],
                        public_variables: params[:public_variables],
                        protected_variables: params[:protected_variables],
                        private_variables: params[:private_variables],
                        number_of_lines: params[:number_of_lines],
                        number_of_methods: params[:number_of_methods],
                        average_lines_per_method: params[:average_lines_per_method],
                        average_method_complexity: params[:average_method_complexity],
                        weighted_methods_per_class: params[:weighted_methods_per_class],
                        depth_of_inheritance: params[:depth_of_inheritance],
                        LCOM: params[:lcom],
                        CBO: params[:cbo],
                        sdmc: params[:sdmc],
                        result_set_group_id: rsg.id,
                        is_total: params[:is_total])
          end
        end
      end
    end
  end
end


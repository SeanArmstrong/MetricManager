module API::V1
  class Root < Grape::API
    version 'v1'
    mount API::V1::Users
    mount API::V1::Projects
    mount API::V1::Klasses
    mount API::V1::Methoods
  end
end

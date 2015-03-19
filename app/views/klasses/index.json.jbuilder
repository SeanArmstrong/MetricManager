json.array!(@klasses) do |klass|
  json.extract! klass, :id
  json.url klass_url(klass, format: :json)
end

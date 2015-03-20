json.array!(@klass_result_sets) do |klass_result_set|
  json.extract! klass_result_set, :id
  json.url klass_result_set_url(klass_result_set, format: :json)
end

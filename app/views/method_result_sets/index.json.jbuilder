json.array!(@method_result_sets) do |method_result_set|
  json.extract! method_result_set, :id
  json.url method_result_set_url(method_result_set, format: :json)
end

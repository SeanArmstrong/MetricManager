json.array!(@methoods) do |methood|
  json.extract! methood, :id
  json.url methood_url(methood, format: :json)
end

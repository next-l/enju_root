json.array!(@nomina) do |nomen|
  json.extract! nomen, :id, :name
  json.url nomen_url(nomen, format: :json)
end

json.array!(@themata) do |thema|
  json.extract! thema, :id, :node, :term, :category
  json.url thema_url(thema, format: :json)
end

json.array!(@classifications) do |classification|
  json.extract! classification, :id, :node, :term, :category
  json.url classification_url(classification, format: :json)
end

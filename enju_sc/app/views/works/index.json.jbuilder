json.array!(@works) do |work|
  json.extract! work, :id, :title_proper, :url
  json.url work_url(work, format: :json)
end

json.array!(@work_and_classifications) do |work_and_classification|
  json.extract! work_and_classification, :id, :work_id, :classification_id
  json.url work_and_classification_url(work_and_classification, format: :json)
end

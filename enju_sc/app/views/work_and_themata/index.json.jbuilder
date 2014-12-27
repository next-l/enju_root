json.array!(@work_and_themata) do |work_and_thema|
  json.extract! work_and_thema, :id, :work_id, :thema_id
  json.url work_and_thema_url(work_and_thema, format: :json)
end

@thema.nomina.each do |nomen|
  json.term nomen.name
  json.scheme nomen.scheme
  json.label nomen.derived_nomina.where(scheme: nil).pluck(:name).join(' ')
end

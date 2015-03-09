@thema.nomina.each do |nomen|
  json.term nomen.name
  json.scheme nomen.scheme
end

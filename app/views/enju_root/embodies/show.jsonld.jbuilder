json.set! "@id", embody_url(@embody)
json.set! "@type", "Annotation"
json.body do
  json.set! "@id", expression_url(@embody.expression)
end
json.target @embody.manifestation_url

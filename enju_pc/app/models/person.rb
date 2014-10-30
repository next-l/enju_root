class Person < ActiveRecord::Base
  attr_accessor :label_name
  belongs_to :manifestation

  def ndla_url
    ndla["results"]["bindings"][0]["uri1"]["value"]
  end

  def to_ndla
    JSON.parse(Faraday.get("#{ndla_url}.json").body)
  end

  def ndla
    #sparql = SPARQL::Client.new(url)
    query = <<EOL
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rda: <http://RDVocab.info/ElementsGr2/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX xl: <http://www.w3.org/2008/05/skos-xl#>
PREFIX ndl: <http://ndl.go.jp/dcndl/terms/>
SELECT * WHERE {
?uri1 foaf:primaryTopic ?uri2.
?uri1 xl:prefLabel [ xl:literalForm ?heading; ndl:transcription ?yomi ].
?uri2 rda:dateOfBirth ?birth.
?uri2 rda:dateOfDeath ?death.
?uri2 foaf:name "#{name.gsub(', ', '')}".
FILTER (lang(?yomi) = 'ja-Kana').
}
EOL
    url = "http://id.ndl.go.jp/auth/ndla?query=#{URI.encode(query)}&output=json"
    JSON.parse(Faraday.get(url).body)
  end
end

# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  work_id    :integer
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

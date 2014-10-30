class Manifestation < ActiveRecord::Base
  #attr_accessible :cinii_title, :extent, :note,
  #  :bib_id, :source_year, :examined_year,
  #  :textbook_code, :textbook_number, :textbook_subject, :course,
  #  :edition, :start_year, :end_year, :url,
  #  :expression_id
  has_many :embodies
  has_many :expressions, through: :embodies
  #has_many :produces, dependent: :destroy, foreign_key: 'manifestation_id'
  #has_many :producers, through: :produces, source: :agent #, order: 'produces.position'
  #has_many :people, foreign_key: 'work_id'

  #validates :cinii_title, presence: true
  validates :url, presence: true, uniqueness: true

  after_save :generate_graph if Setting.generate_graph

  attr_accessor :expression_id

  searchable do
    text :title do
      titles
    end
    #string :textbook_subject
    #string :course
    #text :producer do
    #  producers.pluck(:full_name)
    #end
    integer :expression_ids, multiple: true
    #text :creator
    #text :publisher
    #string :classification_number
  end

  #def creators
  #  Agent.where(id: Create.where(:work_id => expressions.joins(:reify).pluck(:work_id)).pluck(:agent_id))
  #end

  def generate_graph
    expressions.each do |e|
      e.generate_graph
    end
    g = GraphViz::new("G", :type => :graph, :use => "dot")
    g.node[:shape] = "box"
    g.node[:color] = "blue"
    g.node[:fontsize] = 10

    m = g.add_nodes("[M#{id}] #{cinii_title}", "URL" => "/manifestations/#{id}", :fontcolor => "red", :shape => "box")

    expressions.each do |expression|
      e = g.add_nodes("[E#{expression.id}] #{expression.language} #{expression.content_type.name}", "URL" => "/expressions/#{expression.id}")
      g.add_edges(e, m)
      w = g.add_nodes("[W#{expression.work.id}] #{expression.work.preferred_title}", "URL" => "/works/#{expression.work.id}")
      g.add_edges(w, e)
      expression.manifestations.each do |manifestation|
        if manifestation != self
          m2 = g.add_nodes("[M#{manifestation.id}] #{manifestation.cinii_title}", "URL" => "/manifestations/#{manifestation.id}")
          g.add_edges(e, m2)
        end
      end
    end
    g.output(:png => "#{Rails.root.to_s}/public/manifestations/#{id}.png")
    g.output(:svg => "#{Rails.root.to_s}/public/manifestations/#{id}.svg")
  end

  def titles
    title = []
    title << cinii_title
    title << expressions.map{|expression| [expression.preferred_title, expression.work.preferred_title, expression.work.expressions.pluck(:preferred_title)]}.flatten
    title
  end

  def cinii_title
    # CiNii Books
    cinii_doc.at("//dc:title").content

    # NDL Search
    #cinii_doc.at('//dcterms:title').content
  end

  def cinii_creator
    cinii_doc.at("//dc:creator").try(:content)
  end

  def cinii_publisher
    cinii_doc.at("//dc:publisher").content
  end

  def cinii_doc
    Nokogiri::XML(Faraday.get("#{url.to_s}.rdf").body)
  end

  def authors
    cinii_doc.xpath('//foaf:maker', "foaf" => "http://xmlns.com/foaf/0.1/").xpath('./foaf:Person/foaf:name[not(@xml:lang)]').map{|e| e.content}
  end

  def create_authors
    authors.each do |author|
      person = Person.new(name: author)
      person.manifestation = self
      person.save
    end
  end
end

# == Schema Information
#
# Table name: manifestations
#
#  id               :integer          not null, primary key
#  title_proper     :text
#  carrier_type_id  :integer
#  created_at       :datetime
#  updated_at       :datetime
#  bib_id           :string(255)
#  edition          :string(255)
#  source_year      :integer
#  start_year       :integer
#  end_year         :integer
#  examined_year    :integer
#  textbook_code    :string(255)
#  textbook_number  :integer
#  extent           :string(255)
#  note             :text
#  textbook_subject :string(255)
#  course           :string(255)
#  url              :string(255)
#

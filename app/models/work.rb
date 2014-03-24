class Work < ActiveRecord::Base
  attr_accessible :preferred_title, :manifestation_id, :parent_id,
    :create_expression, :variant_title, :intended_audience
  attr_accessible :manifestation_url, :work_url, :form_of_work, :date_of_work,
    :parent_work_url
  attr_accessible :place_of_origin, :other_distinguishing_characteristic,
    :identifier, :medium_of_performance, :numeric_designation, :key,
    :authorized_access_point, :variant_access_point,
    :signatory_for_treaty, :status_of_identification, :source_consulted,
    :cataloguers_note

  has_many :reifies
  has_many :expressions, :through => :reifies
  has_many :creates, :dependent => :destroy, :foreign_key => 'work_id'
  has_many :creators, :through => :creates, :source => :agent #, :order => 'creates.position'
  has_many :children_relationships, :foreign_key => 'parent_id', :class_name => 'WorkRelationship', :dependent => :destroy
  has_many :parents_relationships, :foreign_key => 'child_id', :class_name => 'WorkRelationship', :dependent => :destroy
  has_many :children, :through => :children_relationships, :source => :child
  has_many :parents, :through => :parents_relationships, :source => :parent

  validates :preferred_title, :presence => true

  after_save :generate_graph if Setting.generate_graph

  searchable do
    text :preferred_title do
      titles
    end
    string :url, :multiple => true do
      expressions.map{|e| e.manifestations.pluck(:url)}.flatten
    end
    text :url do
      expressions.map{|e| e.manifestations.pluck(:url)}.flatten
    end
    integer :creator_ids, :multiple => true
    string :classification_number, :multiple => true do
      expressions.map{|e| e.manifestations.pluck(:classification_number)}.flatten
    end
  end

  attr_accessor :manifestation_id, :parent_id, :create_expression,
    :manifestation_url, :work_url

  def titles
    [preferred_title, expressions.map{|e| e.manifestations.map{|m| m.cinii_title}}].flatten
  end

  def generate_graph
    children.each do |c|
      c.generate_graph
    end
    g = GraphViz::new("G", :type => :graph, :use => "dot")
    g.node[:shape] = "plaintext"
    g.node[:fontsize] = 10

    w = g.add_nodes("[W#{id}] #{preferred_title}", "URL" => "/works/#{id}", :fontcolor => "red", :shape => 'box', :color => 'blue')

    parents.each do |parent|
      p = g.add_nodes("[W#{parent.id}] #{parent.preferred_title}", "URL" => "/works/#{parent.id}", :shape => 'box', :color => 'blue')
      g.add_edges(p, w)
    end

    children.each do |child|
      c = g.add_nodes("[W#{child.id}] #{child.preferred_title}", "URL" => "/works/#{child.id}", :shape => 'box', :color => 'blue')
      g.add_edges(w, c)
      child.expressions.each do |expression|
        e3 = g.add_nodes("[E#{expression.id}] #{expression.language} #{expression.content_type.name}", "URL" => "/expressions/#{expression.id}", :shape => 'box', :color => 'blue')
        g.add_edges(c, e3)
        expression.manifestations.each do |manifestation|
          m = g.add_nodes("[M#{manifestation.id}] #{manifestation.cinii_title}", "URL" => "/manifestations/#{manifestation.id}", :shape => 'box', :color => 'blue')
          g.add_edges(e3, m)
        end
      end
    end

    expressions.each do |expression|
      e = g.add_nodes("[E#{expression.id}] #{expression.language} #{expression.content_type.try(:name)}", "URL" => "/expressions/#{expression.id}", :shape => 'box', :color => 'blue')
      g.add_edges(w, e)
      expression.manifestations.each do |manifestation|
        m = g.add_nodes("[M#{manifestation.id}] #{manifestation.cinii_title}", "URL" => "/manifestations/#{manifestation.id}", :shape => 'box', :color => 'blue')
        g.add_edges(e, m)
        manifestation.expressions.each do |expression2|
          unless expressions.include?(expression2)
            e2 = g.add_nodes("[E#{expression2.id}] #{expression2.language} #{expression2.content_type.name}", "URL" => "/expressions/#{expression2.id}", :shape => 'box', :color => 'blue')
            g.add_edges(e2, m)
            if expression2.work != self
              w2 = g.add_nodes("[W#{expression2.work.id}] #{expression2.work.preferred_title}", "URL" => "/works/#{expression2.work.id}", :shape => 'box', :color => 'blue')
              g.add_edges(w2, e2)
            end
            expression.work.parents.each do |parent|
              w3 = g.add_nodes("[W#{parent.id}] #{parent.preferred_title}", "URL" => "/works/#{parent.id}", :shape => 'box', :color => 'blue')
              g.add_edges(w3, w2)
            end
          end
        end
      end
    end
    g.output(:png => "#{Rails.root.to_s}/public/works/#{id}.png")
    g.output(:svg => "#{Rails.root.to_s}/public/works/#{id}.svg")
  end

  def self.fetch(work_url)
    doc = Nokogiri::XML(open("#{work_url}.xml"))
    work = Work.new(:preferred_title => doc.at('//work/title').content)
    work.save!
    doc.xpath('//expression').each do |e|
      expression = Expression.new(:preferred_title => e.at('./title').content)
      expression.work = work
      expression.save
    end
    work.parent_work_url = work_url
    work
  end

  def self.search_we(mi_url)
    url = "http://ja-textbook.herokuapp.com/works.json?query=#{mi_url}"
    JSON.parse(open(url).read)
  end
end

module EnjuRoot
  class Work < ActiveRecord::Base
    has_many :expressions
    #has_many :agents
    has_many :children_relationships, foreign_key: 'parent_id', class_name: 'WorkRelationship', dependent: :destroy
    has_many :parents_relationships, foreign_key: 'child_id', class_name: 'WorkRelationship', dependent: :destroy
    has_many :children, through: :children_relationships, source: :child
    has_many :parents, through: :parents_relationships, source: :parent
    belongs_to :form_of_work

    validates :preferred_title, presence: true
    validates :form_of_work_id, presence: true
    #after_save :generate_graph
    attachment :work_graph

    searchable do
      text :preferred_title do
        titles
      end
      string :url, multiple: true do
        expressions.map{|e| e.manifestations.pluck(:manifestation_url)}.flatten
      end
      text :url do
        expressions.map{|e| e.manifestations.pluck(:manifestation_url)}.flatten
      end
      #text :subject do
      #  subjects.map{|s| [s.remote_term, s.remote_label]}.flatten
      #end
      #integer :creator_ids, multiple: true
      #string :classification_number, multiple: true do
      #  expressions.map{|e| e.manifestations.pluck(:classification_number)}.flatten
      #end
      #string :subject_url, multiple: true do
      #  subjects.pluck(:url)
      #end
      #string :subject, multiple: true do
      #  subjects.map{|subject| subject.remote_term}
      #end
      #text :subject do
      #  subjects.map{|subject| subject.remote_term}
      #end
    end

    attr_accessor :manifestation_id, :parent_id, :create_expression,
      :manifestation_url, :work_url

    def titles
      [preferred_title, expressions.map{|e| e.manifestations.map{|m| m.cinii_title}}].flatten
    end

    def frbr_graph
      work_graph
    end

    def self.fetch(work_url)
      doc = Nokogiri::XML(Faraday.get("#{work_url}.xml").body)
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
      url = "#{Rails.application.secrets.enju_root['sc_url']}/works.json?query=#{mi_url}"
      JSON.parse(Faraday.get(url).body)
    end
  end
end

# == Schema Information
#
# Table name: enju_root_works
#
#  id              :integer          not null, primary key
#  preferred_title :text
#  form_of_work_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

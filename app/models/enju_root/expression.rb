module EnjuRoot
  class Expression < ActiveRecord::Base
    belongs_to :work
    belongs_to :language
    belongs_to :content_type
    has_many :embodies
    has_many :manifestations, through: :embodies

    validates :language_id, presence: true
    validates :content_type_id, presence: true

    #after_save :generate_graph
    attachment :expression_graph

    searchable do
      integer :work_id
      #integer :manifestation_ids, multiple: true
    end

    attr_accessor :manifestation_id, :manifestation_url

    def frbr_graph
      expression_graph
    end

    def generate_graph
    #  begin
      work.generate_graph
      g = GraphViz::new("G", :type => :graph, :use => "dot")
      g.node[:shape] = "box"
      g.node[:color] = "blue"
      g.node[:fontsize] = 10

      e = g.add_nodes("[E#{id}] #{language.display_name} #{content_type.try(:name)}", "URL" => "/expressions/#{id}", :fontcolor => "red", :shape => 'box', :color => 'blue')
      w = g.add_nodes("[W#{work.id}] #{work.preferred_title}", "URL" => "/works/#{work.id}", :shape => 'box', :color => 'blue')
      g.add_edges(w, e)

      work.expressions.each do |expression|
        if expression != self
          e = g.add_nodes("[E#{expression.id}] #{expression.language.display_name} #{expression.content_type.display_name}", "URL" => "/expressions/#{expression.id}")
          g.add_edges(w, e)
        end
      end

      #manifestations.each do |manifestation|
      #  m = g.add_nodes("[M#{manifestation.id}] #{manifestation.cinii_title}", "URL" => "/manifestations/#{manifestation.id}")
      #  g.add_edges(e, m)
      #  manifestation.expressions.each do |expression|
      #    if expression != self
      #      e2 = g.add_nodes("[E#{expression.id}] #{expression.language} #{expression.content_type.name}", "URL" => "/expressions/#{expression.id}")
      #      g.add_edges(e2, m)

      #      w2 = g.add_nodes("[W#{expression.work.id}] #{expression.work.preferred_title}", "URL" => "/works/#{expression.work.id}")
      #      g.add_edges(w2, e2)
      #    end
      #  end
      #end
      Tempfile.open("expression_graph_#{id}") do |file|
        g.output(:svg => file.path)
        self.expression_graph = file
      end
    end
  end
end

# == Schema Information
#
# Table name: enju_root_expressions
#
#  id              :integer          not null, primary key
#  work_id         :integer
#  language_id     :integer
#  content_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Nomen < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.application.engine_name, Rails.env].join('_')
  has_many :thema_and_nomina
  has_many :themata, through: :thema_and_nomina
  has_many :children, foreign_key: 'parent_id', class_name: 'NomenRelationship', dependent: :destroy
  has_many :parents, foreign_key: 'child_id', class_name: 'NomenRelationship', dependent: :destroy
  has_many :derived_nomina, through: :children, source: :child
  has_many :original_nomina, through: :parents, source: :parent

  #acts_as_tree
  settings do
    mappings dynamic: 'false' do
      indexes :name
      indexes :parent_id, type: 'integer'
    end
  end
  attr_accessor :new_parent, :parent_url, :child_url
end

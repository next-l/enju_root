class Thema < ActiveRecord::Base
  extend FriendlyId
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.application.engine_name, Rails.env].join('_')
  friendly_id :node
  has_many :thema_and_nomina
  has_many :nomina, through: :thema_and_nomina
#  acts_as_nested_set
  acts_as_tree
  settings do
    mappings dynamic: 'false' do
      indexes :node
      indexes :category
      indexes :term
      indexes :work_url
      indexes :parent_id, type: 'integer'
    end
  end
  attr_accessor :new_parent
end

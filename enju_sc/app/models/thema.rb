class Thema < ActiveRecord::Base
  extend FriendlyId
  friendly_id :node
  has_many :thema_and_nomina
  has_many :nomina, through: :thema_and_nomina
#  acts_as_nested_set
  acts_as_tree
  searchable do
    string :node
    string :category
    text :term
    string :work_url
    integer :parent_id
  end
  attr_accessor :new_parent
end

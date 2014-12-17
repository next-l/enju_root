class Classification < ActiveRecord::Base
  extend FriendlyId
  friendly_id :node
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

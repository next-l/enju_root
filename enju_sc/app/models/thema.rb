class Thema < ActiveRecord::Base
#  acts_as_nested_set
  acts_as_tree
  searchable do
    string :node
    string :category
    text :term
    string :work_url
  end
  attr_accessor :new_parent
end

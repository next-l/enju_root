module EnjuRoot
  class WorkRelationship < ActiveRecord::Base
    belongs_to :parent, foreign_key: 'parent_id', class_name: 'Work'
    belongs_to :child, foreign_key: 'child_id', class_name: 'Work'
    #belongs_to :work_relationship_type
    validates :parent_id, presence: true
    validates :child_id, uniqueness: {scope: :parent_id}, presence: true
  end
end

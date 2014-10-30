class WorkRelationshipType < ActiveRecord::Base
  #attr_accessible :name, :position, :definition, :url
  acts_as_list
end

# == Schema Information
#
# Table name: work_relationship_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#  definition :text
#  url        :string(255)
#

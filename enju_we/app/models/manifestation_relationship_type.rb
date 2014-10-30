class ManifestationRelationshipType < ActiveRecord::Base
  #attr_accessible :definition, :name, :position, :url
end

# == Schema Information
#
# Table name: manifestation_relationship_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  position   :integer
#  definition :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

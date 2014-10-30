class Produce < ActiveRecord::Base
  #attr_accessible :manifestation_id, :agent_id
  belongs_to :manifestation
  belongs_to :agent
end

# == Schema Information
#
# Table name: produces
#
#  id               :integer          not null, primary key
#  manifestation_id :integer
#  agent_id         :integer
#  created_at       :datetime
#  updated_at       :datetime
#

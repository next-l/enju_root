class Produce < ActiveRecord::Base
  attr_accessible :manifestation_id, :agent_id
  belongs_to :manifestation
  belongs_to :agent
end

class Create < ActiveRecord::Base
  #attr_accessible :work_id, :agent_id
  belongs_to :work
  belongs_to :agent
end

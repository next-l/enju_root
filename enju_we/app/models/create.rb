class Create < ActiveRecord::Base
  #attr_accessible :work_id, :agent_id
  belongs_to :work
  belongs_to :agent
end

# == Schema Information
#
# Table name: creates
#
#  id         :integer          not null, primary key
#  work_id    :integer
#  agent_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

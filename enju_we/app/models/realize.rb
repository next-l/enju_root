class Realize < ActiveRecord::Base
  #attr_accessible :expression_id, :agent_id
  belongs_to :expression
  belongs_to :agent
  validates_uniqueness_of :expression_id, scope: :work_id
end

# == Schema Information
#
# Table name: realizes
#
#  id            :integer          not null, primary key
#  expression_id :integer
#  agent_id      :integer
#  created_at    :datetime
#  updated_at    :datetime
#

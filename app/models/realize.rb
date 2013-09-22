class Realize < ActiveRecord::Base
  attr_accessible :expression_id, :agent_id
  belongs_to :expression
  belongs_to :agent
  validates_uniqueness_of :expression_id, :scope => :work_id
end

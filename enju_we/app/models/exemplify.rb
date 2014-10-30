class Exemplify < ActiveRecord::Base
  belongs_to :manifestation
  belongs_to :item
  # attr_accessible :title, :body

  after_save :create_index

  def create_index
    manifestation.index
    item.index
    Sunspot.commit
  end
end

# == Schema Information
#
# Table name: exemplifies
#
#  id               :integer          not null, primary key
#  manifestation_id :integer
#  item_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

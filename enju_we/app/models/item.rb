class Item < ActiveRecord::Base
  #attr_accessible :item_identifier

  searchable do
    string :item_identifier
  end

  validates :item_identifier, presence: true
end

# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  item_identifier :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

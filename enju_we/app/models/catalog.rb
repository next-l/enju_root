class Catalog < ActiveRecord::Base
  #attr_accessible :name, :url
  validates :name, presence: true
  validates :url, presence: true
end

# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Family < ActiveRecord::Base
  #attr_accessible :dates, :field_of_activity, :history, :identifier_id, :name_id, :places_associated, :type_of_family
end

# == Schema Information
#
# Table name: families
#
#  id                :integer          not null, primary key
#  name_id           :integer
#  identifier_id     :integer
#  type_of_family    :text
#  dates             :text
#  places_associated :text
#  field_of_activity :text
#  history           :text
#  created_at        :datetime
#  updated_at        :datetime
#

class ControlledAccessPoint < ActiveRecord::Base
  #attr_accessible :addition, :base_access_point_id, :base_access_point_language_id, :cataloging_language_id, :designated_usage, :script_of_base_access_point, :script_of_cataloging, :source, :status, :transliteration_scheme_of_cataloging, :transliteratrion_scheme_of_base_access_point, :type_of_controlled_access_point, :undifferentiated_access_point
end

# == Schema Information
#
# Table name: controlled_access_points
#
#  id                                           :integer          not null, primary key
#  type_of_controlled_access_point              :string(255)
#  status                                       :text
#  designated_usage                             :text
#  undifferentiated_access_point                :text
#  base_access_point_language_id                :integer
#  cataloging_language_id                       :integer
#  script_of_base_access_point                  :text
#  script_of_cataloging                         :text
#  transliteratrion_scheme_of_base_access_point :text
#  transliteration_scheme_of_cataloging         :text
#  source                                       :text
#  base_access_point_id                         :integer
#  addition                                     :text
#  created_at                                   :datetime
#  updated_at                                   :datetime
#

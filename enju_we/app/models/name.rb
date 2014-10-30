class Name < ActiveRecord::Base
  #attr_accessible :dates_of_usage, :language_id, :name_string, :scope_of_usage, :script, :transliteration_scheme, :type_of_name
  belongs_to :language
end

# == Schema Information
#
# Table name: names
#
#  id                     :integer          not null, primary key
#  type_of_name           :string(255)
#  name_string            :string(255)
#  scope_of_usage         :text
#  dates_of_usage         :text
#  language_id            :integer
#  script                 :string(255)
#  transliteration_scheme :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

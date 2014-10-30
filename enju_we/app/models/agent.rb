class Agent < ActiveRecord::Base
  belongs_to :work
end

# == Schema Information
#
# Table name: agents
#
#  id                         :integer          not null, primary key
#  full_name                  :text
#  agent_type_id              :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#  date_of_bitrh              :datetime
#  date_of_death              :datetime
#  period_of_activity         :text
#  title                      :text
#  gender_id                  :integer
#  place_of_birth             :string(255)
#  place_of_death             :string(255)
#  country_id                 :integer
#  place_of_residence         :string(255)
#  affiliation                :string(255)
#  address                    :text
#  field_of_activity          :text
#  profession                 :string(255)
#  history                    :text
#  other_information_elements :text
#  url                        :string(255)
#

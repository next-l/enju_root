require 'rails_helper'

RSpec.describe Work, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: works
#
#  id                                  :integer          not null, primary key
#  preferred_title                     :text
#  created_at                          :datetime
#  updated_at                          :datetime
#  form_of_work                        :string(255)
#  date_of_work                        :date
#  parent_work_url                     :text
#  variant_title                       :text
#  intended_audience                   :text
#  place_of_origin                     :text
#  other_distinguishing_characteristic :text
#  identifier                          :string(255)
#  medium_of_performance               :string(255)
#  numeric_designation                 :text
#  key                                 :text
#  signatory_for_treaty                :text
#  authorized_access_point             :text
#  variant_access_point                :text
#  status_of_identification            :string(255)
#  source_consulted                    :text
#  cataloguers_note                    :text
#

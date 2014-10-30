require 'rails_helper'

RSpec.describe Expression, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: expressions
#
#  id                                       :integer          not null, primary key
#  preferred_title                          :text
#  content_type_id                          :integer
#  created_at                               :datetime
#  updated_at                               :datetime
#  note                                     :text
#  language                                 :string(255)
#  date_of_expression                       :datetime
#  other_distinguishing_characteristic      :text
#  horizontal_scale_of_cartographic_content :string(255)
#  vertical_scale_of_cartographic_content   :string(255)
#  authorized_access_point                  :text
#  variant_access_point                     :text
#  status_of_identification                 :string(255)
#  source_consulted                         :text
#  cataloguers_note                         :text
#

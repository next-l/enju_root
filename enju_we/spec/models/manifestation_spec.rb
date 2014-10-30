require 'rails_helper'

RSpec.describe Manifestation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: manifestations
#
#  id               :integer          not null, primary key
#  title_proper     :text
#  carrier_type_id  :integer
#  created_at       :datetime
#  updated_at       :datetime
#  bib_id           :string(255)
#  edition          :string(255)
#  source_year      :integer
#  start_year       :integer
#  end_year         :integer
#  examined_year    :integer
#  textbook_code    :string(255)
#  textbook_number  :integer
#  extent           :string(255)
#  note             :text
#  textbook_subject :string(255)
#  course           :string(255)
#  url              :string(255)
#

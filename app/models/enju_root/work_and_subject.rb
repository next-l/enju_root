module EnjuRoot
  class WorkAndSubject < ActiveRecord::Base
  end
end

# == Schema Information
#
# Table name: enju_root_work_and_subjects
#
#  id                   :integer          not null, primary key
#  source_url           :string
#  destination_url      :string
#  relationship_type_id :integer
#  note                 :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

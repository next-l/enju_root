class Subject < ActiveRecord::Base
  #attr_accessible :subject_heading_id, :subject_type_id, :term
  belongs_to :work

  def remote_term
    if url
      JSON.parse(Faraday.get("#{url}.json").body)["term"]
    end
  end
end

# == Schema Information
#
# Table name: subjects
#
#  id                 :integer          not null, primary key
#  term               :string(255)
#  subject_heading_id :integer
#  subject_type_id    :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Subject < ActiveRecord::Base
  #attr_accessible :subject_heading_id, :subject_type_id, :term
  belongs_to :work

  def remote_term
    if url
      response = Faraday.get("#{url}.json")
      if response.status == 200
        JSON.parse(response.body)["term"]
      end
    end
  end

  def remote_label
    if url
      response = Faraday.get("#{url}.json")
      if response.status == 200
        JSON.parse(response.body)["label"]
      end
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

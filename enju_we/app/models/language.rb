class Language < ActiveRecord::Base
  #attr_accessible :display_name, :iso_639_1, :iso_639_2, :iso_639_3, :name, :native_name, :note, :position
end

# == Schema Information
#
# Table name: languages
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  native_name  :string(255)
#  display_name :text
#  iso_639_1    :string(255)
#  iso_639_2    :string(255)
#  iso_639_3    :string(255)
#  note         :text
#  position     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

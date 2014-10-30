class Identifier < ActiveRecord::Base
  #attr_accessible :type_of_identifier
end

# == Schema Information
#
# Table name: identifiers
#
#  id                 :integer          not null, primary key
#  type_of_identifier :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

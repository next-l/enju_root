module EnjuRoot
  class Nomen < ActiveRecord::Base
    has_many :thema_and_nomens
    has_many :themas, through: :thema_and_nomens

    searchable do
      text :name
      string :scheme
    end
  end
end

# == Schema Information
#
# Table name: enju_root_nomen
#
#  id         :integer          not null, primary key
#  name       :string
#  scheme     :string
#  dimension  :integer
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module EnjuRoot
  class Thema < ActiveRecord::Base
    has_many :thema_and_nomens
    has_many :nomens, through: :thema_and_nomens

    searchable do
      text :node
    end
  end
end

# == Schema Information
#
# Table name: enju_root_themas
#
#  id         :integer          not null, primary key
#  node       :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

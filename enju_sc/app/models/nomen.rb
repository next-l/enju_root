class Nomen < ActiveRecord::Base
  has_many :thema_and_nomina
  has_many :themata, through: :thema_and_nomina
  acts_as_tree
end

module EnjuRoot
  class Manifestation < ActiveRecord::Base
    has_many :embodies
    has_many :expressions, through: :embodies
  end
end

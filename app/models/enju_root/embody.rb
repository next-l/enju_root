module EnjuRoot
  class Embody < ActiveRecord::Base
    belongs_to :expression
    belongs_to :manifestation

    attr_accessor :manifestation_url
  end
end

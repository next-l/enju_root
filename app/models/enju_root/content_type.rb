module EnjuRoot
  class ContentType < ActiveRecord::Base
    has_many :expressions
  end
end

class Work < ActiveRecord::Base
  has_many :work_and_classifications
  has_many :classifications, through: :work_and_classifications
end

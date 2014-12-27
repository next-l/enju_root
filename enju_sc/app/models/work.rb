class Work < ActiveRecord::Base
  has_many :work_and_themata
  has_many :themata, through: :work_and_themata
end

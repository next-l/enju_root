class WorkAndClassification < ActiveRecord::Base
  belongs_to :work
  belongs_to :classification
end

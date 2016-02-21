module EnjuRoot
  class Language < ActiveRecord::Base
    include EnjuRoot::MasterModel
    validates :name, presence: true, format: { with: /\A[0-9A-Za-z][0-9A-Za-z_\-\s,]*[0-9a-z]\Z/ }
  end
end

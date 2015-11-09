module EnjuRoot
  class Language < ActiveRecord::Base
    validates_presence_of :iso_639_1, :iso_639_2, :iso_639_3
    validates :name, presence: true, format: { with: /\A[0-9A-Za-z][0-9A-Za-z_\-\s,]*[0-9a-z]\Z/ }
  end
end

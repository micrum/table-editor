class Fragment < ActiveRecord::Base
  validates :datatype, :value, presence: true

  enum datatype: [:string, :number]
end
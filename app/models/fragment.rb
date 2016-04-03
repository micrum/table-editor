class Fragment < ActiveRecord::Base
  enum datatype: [:string, :number]
end

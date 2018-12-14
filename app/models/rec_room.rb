class RecRoom < ApplicationRecord
    
  has_many :rec_messages
  has_many :rec_entries

    
end

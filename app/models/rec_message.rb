class RecMessage < ApplicationRecord
    
  belongs_to :user
  belongs_to :rec_room
    
end

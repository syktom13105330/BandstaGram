class RecEntry < ApplicationRecord
  
  belongs_to :rec_room
  belongs_to :user
end

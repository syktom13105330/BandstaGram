class RecRoom < ApplicationRecord
    
  has_many :rec_messages, dependent: :destroy
  has_many :rec_entries, dependent: :destroy
  belongs_to :recruitment

    
end

class BandDetail < ApplicationRecord
    
  belongs_to :user, optional: true
  validates :user_id, {presence: true}

  validate :check_number_of_BandDetails
  
  def check_number_of_BandDetails
    if user && user.band_details.count > 4
      errors.add(:user, "Too many posts!")
    end
  end

end

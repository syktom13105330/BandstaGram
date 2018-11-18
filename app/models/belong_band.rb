class BelongBand < ApplicationRecord
  
  # belongs_to :user, optional: true
  # belongs_to :user, class_name: "User", foreign_key: "user_id", optional: true
  # belongs_to :band, class_name: "User", foreign_key: "band_id", optional: true
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :band, class_name: "User", foreign_key: "band_id"
  
  validates :user_id, {presence: true}
  validates :band_id, {presence: true}

end

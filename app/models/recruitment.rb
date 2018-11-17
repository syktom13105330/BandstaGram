class Recruitment < ApplicationRecord
  
  belongs_to :user, class_name: "User", foreign_key: "band_id", optional: true
  validates :band_id, {presence: true}
end

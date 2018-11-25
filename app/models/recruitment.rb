class Recruitment < ApplicationRecord
  
  # belongs_to :user, class_name: "User", foreign_key: "band_id", optional: true
  belongs_to :user, class_name: "User", foreign_key: "band_id"
  validates :band_id, {presence: true}
  
  def self.search(search)
    if search
      Recruitment.where(Recruitment.arel_table[:genre].matches("%#{search}%"))
    else
      Recruitment.all
    end
  end
  
end

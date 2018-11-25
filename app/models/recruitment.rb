class Recruitment < ApplicationRecord
  
  # belongs_to :user, class_name: "User", foreign_key: "band_id", optional: true
  belongs_to :user, class_name: "User", foreign_key: "band_id"
  validates :band_id, {presence: true}
  
  def self.search(search)
    genre = Submit.where("genre = ?", params[:genre]).pluck(:id)
  end
  
end

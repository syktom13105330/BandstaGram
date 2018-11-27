class Recruitment < ApplicationRecord
  
  # 以下２行11/26追加
  # include ActiveModel::Model
  # attr_accessor :band_id, :r_info, :expired, :part_id, :genre_id, :area_id

  # belongs_to :user, class_name: "User", foreign_key: "band_id", optional: true
  belongs_to :user, class_name: "User", foreign_key: "band_id"
  validates :band_id, {presence: true}
  
  def self.search(search)
    if search[0].present?
            logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~2 ")

      Recruitment.where(Recruitment.arel_table[:area].matches("#{search[0].to_i}")) && 
      Recruitment.where(Recruitment.arel_table[:part].matches("#{search[1].to_i}")) &&
      Recruitment.where(Recruitment.arel_table[:genre].matches("#{search[2].to_i}"))
    else
      logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ ")
      Recruitment.all.order(id: "desc")
    end
  end
  
end

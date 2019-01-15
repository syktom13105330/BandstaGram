class Recruitment < ApplicationRecord
  
  # 以下２行11/26追加
  # include ActiveModel::Model
  # attr_accessor :band_id, :r_info, :expired, :part_id, :genre_id, :area_id

  # belongs_to :user, class_name: "User", foreign_key: "band_id", optional: true
  belongs_to :user, class_name: "User", foreign_key: "band_id"
  validates :band_id, {presence: true}
  has_many :app_messages, dependent: :destroy
  has_many :rec_rooms, dependent: :destroy
  has_many :rec_entries, dependent: :destroy


  def self.search(search)
     if search[0] != nil || search[1] != nil || search[2] != nil
        if     search[0] == "" && search[1] == "" && search[2] == ""
            logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ search 1 = #{search} ")
          Recruitment.all.order(id: "desc")
        elsif  search[0] == "" && search[1] == "" && search[2] != ""
            logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ search 2 = #{search} ")
          Recruitment.where("genre = ?", search[2]) 
        elsif  search[0] == "" && search[1] != "" && search[2] == ""
            logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ search 3 = #{search} ")
          Recruitment.where("part = ?", search[1]) 
        elsif  search[0] != "" && search[1] == "" && search[2] == ""
            logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ search 4 = #{search} ")
          Recruitment.where("area = ?", search[0]) 
        elsif  search[0] == "" && search[1] != "" && search[2] != ""
            logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ search 5 = #{search} ")
          Recruitment.where("part = ? AND genre = ?", search[1], search[2]) 
        elsif  search[0] != "" && search[1] == "" && search[2] != ""
            logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ search 6 = #{search} ")
          Recruitment.where("area = ? AND genre = ?", search[0], search[2]) 
        elsif  search[0] != "" && search[1] != "" && search[2] == ""
            logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ search 7 = #{search} ")
          Recruitment.where("area = ? AND part = ?", search[0], search[1]) 
        # elsif  search[0] != "" && search[1] != "" && search[2] != ""
        elsif  search[0].present? && search[1].present? && search[2].present?
            logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ search 8 = #{search} ")
          Recruitment.where("area = ? AND part = ? AND genre = ?", search[0], search[1], search[2]) 
        end
     else
           logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ search e = #{search} ")
        Recruitment.all.order(id: "desc")
     end   
  end

  # Dec 29 add
  scope :expired_between, -> from, to {
    if from.present? && to.present?
      where(expired: from..to)
    elsif from.present?
      where('expired >= ?', from)
    elsif to.present?
      where('expired <= ?', to)
    end
  }

  # def self.search(search)
  #   if search[0].present?
  #           logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~2 ")

  #     Recruitment.where(Recruitment.arel_table[:area].matches("#{search[0].to_i}")) && 
  #     Recruitment.where(Recruitment.arel_table[:part].matches("#{search[1].to_i}")) &&
  #     Recruitment.where(Recruitment.arel_table[:genre].matches("#{search[2].to_i}"))
  #   else
  #     logger.debug("=~=~=~=~=~=~=~=~=~=~=~=~=~ ")
  #     Recruitment.all.order(id: "desc")
  #   end
  # end
  
end

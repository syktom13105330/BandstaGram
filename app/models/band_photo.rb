class BandPhoto < ApplicationRecord
  
  mount_uploaders :images, BandPhotoUploader
  belongs_to :user
  validates :user_id, {presence: true}
  # validate :check_no_of_images
  
  # def check_no_of_images #アップロードできるファイルの枚数制限
  #   if images.size > 5
  #   errors.add(:images,"Up to 5 files")
  #   end
  # end
  
end

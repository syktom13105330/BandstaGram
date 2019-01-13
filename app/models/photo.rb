class Photo < ApplicationRecord
  
  mount_uploaders :images, PhotoUploader
  belongs_to :user
  has_many :goods, dependent: :destroy
  validates :images, presence: true
  
end

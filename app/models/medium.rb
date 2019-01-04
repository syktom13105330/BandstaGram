class Medium < ApplicationRecord
  
  mount_uploaders :media, MediumUploader
  belongs_to :user
  
end

class Post < ApplicationRecord
  
  # belongs_to :user, class_name: "User", foreign_key: "writer_id", optional: true 
  belongs_to :user, class_name: "User", foreign_key: "writer_id"
  has_many :post_details, dependent: :destroy
  has_many :post_images, dependent: :destroy
  
end

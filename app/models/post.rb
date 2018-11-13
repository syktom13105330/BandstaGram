class Post < ApplicationRecord
  
  belongs_to :user, class_name: "User", foreign_key: "writer_id", optional: true 
  has_many :post_details, dependent: :destroy
  
end

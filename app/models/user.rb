class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, on: [:update]
  
  
  has_many :friends, dependent: :destroy
  has_many :posts

  # has_attached_file :icon, styles: {medium:"300x300>", thumb:"50x50>"}
  
  # validates_attachment :icon, content_type:{content_type:["icon.jpg", "icon.jpeg", "icon.png", "icon.gif"]}
end

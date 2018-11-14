class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, on: [:update]
  
  
  has_many :friends, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :band_details, dependent: :destroy
  
  def self.search(search)
    if search
      User.where(User.arel_table[:name].matches("%#{search}%"))
  else
      User.all
    end
  end
  


  # has_attached_file :icon, default_url: "/user_icon/no_image.png"
  # validate_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/  
  
  # validates_attachment :icon, content_type:{content_type:["icon.jpg", "icon.jpeg", "icon.png", "icon.gif"]}
end

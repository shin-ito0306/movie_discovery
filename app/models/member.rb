class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :member_image
  
  has_many :reverse_of_rerationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :reverse_of_rerationships, sourece: :follower
  
  has_many :rerationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destory
  has_many :followed, through: :rerationships, sourece: :followed
end

class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :member_image
  
  #フォローしている側
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :follower_members, through: :reverse_of_relationships, source: :follower
  
  #フォローされている側
  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_members, through: :relationships, source: :followed
  def following?(member)
    followed_members.include?(member)
  end
end

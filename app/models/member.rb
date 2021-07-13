class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :member_image
  
  #呼び出し元をフォローしている側,followed_id=>フォロ-されているMemeberのID,follower_id=>フォロ-をしているMemberのID
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :follower_members, through: :reverse_of_relationships, source: :follower
  
  #呼び出し元にフォローされている側
  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_members, through: :relationships, source: :followed
  def following?(member)
    followed_members.include?(member)
  end
  
  def self.finder(words)
    return Member.where("name LIKE ?", "%#{words}%")
  end
end

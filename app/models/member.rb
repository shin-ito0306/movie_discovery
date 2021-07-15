class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :member_image
  
  has_many :likes, dependent: :destroy
  
  #呼び出し元をフォローしている側,followed_id=>フォロ-されているMemeberのID,follower_id=>フォロ-をしているMemberのID
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :follower_members, through: :reverse_of_relationships, source: :follower
  
  #呼び出し元にフォローされている側
  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_members, through: :relationships, source: :followed
  
  #通知をもらう側
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  
  #通知をする側
  has_many :active_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  
  
  def following?(member)
    followed_members.include?(member)
  end
  
  def self.finder(words)
    return Member.where("name LIKE ?", "%#{words}%")
  end
  
  def create_notification_follow(current_member, visited)
    follow_search = Notification.where(visiter_id: current_member.id, review_id: review, visited_id: visited, action: 'like')
    if follow_search.blank?
      notification = current_member.passive_notifications.new(visited_id: visited, action: 'follow')
      notification.save if notification.valid?
    end
  end
end

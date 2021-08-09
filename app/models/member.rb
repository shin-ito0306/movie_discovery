class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: { maximum: 20 }
  
  
  
  attachment :member_image
  
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
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
    Member.where("name LIKE ?", "%#{words}%")
  end
  
  def create_notification_follow(current_member)
    follow_search = Notification.where(visiter_id: current_member.id, visited_id: id, action: 'follow')
    if follow_search.blank?
      notification = current_member.passive_notifications.new(visited_id: id, action: 'follow')
      notification.save if notification.valid?
    end
  end
  
  def current_member?(current_member)
    self == current_member
  end
  
  def following_count
    followed_members.count
  end
  
  def followed_count
    follower_members.count
  end
  
  def posted_count
    reviews.count
  end
  
  def review_count(day)
    review_num = self.reviews.where('created_at like ?', "#{day}%")
    return review_num.count
  end
end

class Review < ApplicationRecord
  belongs_to :member
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  def liked_by?(member)
    likes.where(member_id: member.id).exists?
  end
  
  #いいね通知のメソッド
  def create_notification_like(current_member, review, visited)
    like_search = Notification.where(visiter_id: current_member.id, review_id: review, visited_id: visited, action: 'like')
    if like_search.blank?
      notification = current_member.passive_notifications.new(review_id: review, visited_id: visited, action: 'like')
      if notification.visiter_id == notification.visited_id
        notification.checke = true
      end
      notification.save if notification.valid?
    end
  end
end

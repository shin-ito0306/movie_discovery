class Review < ApplicationRecord
  belongs_to :member
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :review_detail, presence: true
  validates :evaluation, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
  
  def liked_by?(member)
    likes.where(member_id: member).exists?
  end
  
  def written_by?(current_member)
    member_id == current_member
  end
  
  #いいねの追加といいねの通知
  def like_by_current_member(current_member)
    like = current_member.likes.new(review_id: id)
    if like.save
      create_notification_like(current_member, id, member_id)
    end
  end
  
  private 
  
  def create_notification_like(current_member, review, visited)
    like_search = Notification.where(visiter_id: current_member.id, review_id: review, visited_id: visited, action: 'like')
    if like_search.blank?
      notification = current_member.passive_notifications.new(review_id: review, visited_id: visited, action: 'like')
      if notification.visiter_id == notification.visited_id
        notification.check = true
      end
      notification.save if notification.valid?
    end
  end
  
  
end


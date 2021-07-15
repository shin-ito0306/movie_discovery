class Review < ApplicationRecord
  belongs_to :member
  has_many :likes, dependent: :destroy
  
  def liked_by?(member)
    likes.where(member_id: member.id).exists
  end
end

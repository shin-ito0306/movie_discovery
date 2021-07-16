class LikesController < ApplicationController
  
  def create
    review = Review.find(params[:review_id])
    like = current_member.likes.new(review_id: review.id)
    if like.save
      review.create_notification_like(current_member, review.id, review.member_id)
    end
    redirect_to review_path(review.id)
  end
  
  def destroy
    review = Review.find(params[:review_id])
    like = current_member.likes.find_by(review_id: review.id)
    like.destroy
    redirect_to review_path(review.id)
    
  end
end

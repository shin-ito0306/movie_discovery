class LikesController < ApplicationController
  
  def create
    @review = Review.find(params[:review_id])
    @review.liked_by_current_member(current_member)
  end
  
  def destroy
    @review = Review.find(params[:review_id])
    like = current_member.likes.find_by(review_id: @review.id)
    like.destroy
  end
end

class LikesController < ApplicationController
  
  def create
    @review = Review.find(params[:review_id])
    @review.like_by_current_member(current_member)
  end
  
  def destroy
    @review = Review.find(params[:review_id])
    current_member.likes.find_by(review_id: @review.id).destroy
  end
end

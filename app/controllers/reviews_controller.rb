class ReviewsController < ApplicationController
  
  def index
    @reviews = Review.where(member_id: current_member.followed_members)
  end
  
  def new
    @review = Review.new
    @movie = Tmdb::Movie.detail(params[:movie_number])
  end
  
  def create
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    if @review.save
      redirect_to member_path(current_member.id)
    else
      render :new
    end
  end
  
  
  private
  def review_params
    params.require(:review).permit(:movie_name, :movie_image, :movie_number, :evalution, :review_detail)
  end
end

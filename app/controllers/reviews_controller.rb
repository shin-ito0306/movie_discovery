class ReviewsController < ApplicationController
  
  def index
    @reviews = Review.where(member_id: current_member.followed_members)
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def new
    @review = Review.new
    @movie = Tmdb::Movie.detail(params[:movie_number])
  end
  
  def create
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    if @review.save
      flash[:notice] = "投稿しました"
      redirect_to member_path(current_member.id)
    else
      @movie = Tmdb::Movie.detail(params[:review][:movie_number])
      render :new
    end
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "編集しました"
      redirect_to member_path(current_member.id)
    else
      render :edit
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to member_path(current_member.id)
  end
  
  
  private
  def review_params
    params.require(:review).permit(:movie_name, :movie_image, :movie_number, :evaluation, :review_detail)
  end
end

class SeeLatersController < ApplicationController
  
  def index 
    @see_laters = SeeLater.serched_by(params[:member_id])
  end
  
  def create
    movie = Tmdb::Movie.detail(params[:movie_number])
    match_movie = SeeLater.where(movie_number: params[:movie_number])
    if match_movie.blank?
      @see = SeeLater.new(movie_name: movie['title'], movie_image: movie['poster_path'], movie_number: movie['id'], member_id: current_member.id)
      if @see.save
        flash[:notice] = "後で見るに追加しました"
        redirect_to movie_path(movie['id'])
      else
        flash[:alert] = "失敗しました"
        redirect_back(fallback_location: movies_path)
      end
    else
      flash[:alert] = "すでに追加済みです"
      redirect_to movie_path(params[:movie_number])
    end
  end
  
  def destroy
    @see = SeeLater.find_by(movie_number: params[:movie_number], member_id: current_member.id)
    @see.destroy
    redirect_to member_path(current_member)
  end
end

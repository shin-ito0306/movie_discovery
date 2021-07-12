class SeeLatersController < ApplicationController
  
  def index 
    @sees = SeeLater.where(member_id: params[:member_id])
  end
  
  def create
    a = Tmdb::Movie.detail(params[:movie_number])
    @see = SeeLater.new(movie_name: a['title'], movie_image: a['poster_path'], movie_number: a['id'], member_id: current_member.id)
    if @see.save
      redirect_to movie_path(a['id'])
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @see = SeeLater.find_by(movie_number: params[:movie_number], member_id: current_member.id)
    @see.destroy
    redirect_to member_see_laters_path
  end
end

class SearchesController < ApplicationController
  def search
    if params[:kind] == "member" && params[:genre] == nil
      @members = Member.finder(params[:word])
    elsif params[:kind] == "movie" && params[:genre] == nil
      @movies = Tmdb::Search.movie(params[:word])
    elsif params[:kind] == "ジャンル" && params[:genre] != nil
      @movies = Tmdb::Genre.movies(params[:genre])
    else
      redirect_back(fallback_location: root_path)
    end
  end
end

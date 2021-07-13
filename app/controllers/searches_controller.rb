class SearchesController < ApplicationController
  def search
    if params[:kind] == "member"
      @members = Member.finder(params[:word])
    elsif params[:kind] == "movie"
      @movies = Tmdb::Search.movie(params[:word])
    elsif params[:kind] == "ジャンル" && params[:genre] != nil
      @movies = Tmdb::Genre.movies(params[:genre])
    end
  end
end

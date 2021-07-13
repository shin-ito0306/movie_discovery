class SearchesController < ApplicationController
  def search
    if params[:kind] == "member"
      @members = Member.finder(params[:word])
    elsif params[:kind] == "movie"
      @movies = Tmdb::Search.movie("#{params[:word]}")
      @a = Tmdb::Genre.movie_list
    end
  end
end

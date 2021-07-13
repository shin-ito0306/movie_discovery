class SearchesController < ApplicationController
  def search
    @kind = params[:kind]
    if params[:kind] == "会員" && params[:genre] == ""
      @members = Member.finder(params[:word])
    elsif params[:kind] == "作品" && params[:genre] == ""
      @movies = Tmdb::Search.movie(params[:word])
    elsif params[:kind] == "ジャンル" && params[:genre] != nil
      @movies = Tmdb::Genre.movies(params[:genre])
    else
      redirect_back(fallback_location: root_path)
    end
  end
end

class MoviesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("94994320f0fad90cdb38b981b4b4af29")
  Tmdb::Api.language("ja")
  
  def index
    @movies = Tmdb::Movie.popular
  end
  
  def show
    @movie = Tmdb::Movie.detail(params[:id])
  end
end

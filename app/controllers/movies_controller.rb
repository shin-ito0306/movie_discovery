class MoviesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key(ENV['API_KEY'])
  Tmdb::Api.language("ja")
  
  def index
    @movies = Tmdb::Movie.popular
  end
  
  def show
    @movie = Tmdb::Movie.detail(params[:id])
  end
end

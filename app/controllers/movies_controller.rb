class MoviesController < ApplicationController
  
  def index
    @movies = Tmdb::Movie.popular
    # @movies = Tmdb::Movie.popular(page: 500)
  end
  
  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @reviews = Review.where(movie_number: params[:id])
  end
end

class MoviesController < ApplicationController
  
  def index
    @movies = Tmdb::Movie.popular
  end
  
  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @reviews = Review.where(movie_number: params[:id])
  end
end

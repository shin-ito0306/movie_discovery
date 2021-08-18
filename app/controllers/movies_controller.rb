class MoviesController < ApplicationController
  
  include MovieHandler
  
  def index
    @page = params[:page_id].to_i
    @movie_total_pages = Tmdb::Movie.popular.total_pages
    @movies = Tmdb::Movie.popular(page: params[:page_id])
  end
  
  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @reviews = Review.where(movie_number: params[:id])
    @recommend_movies = recommend_movies(@movie).map { |recommend_movie| Tmdb::Movie.detail(recommend_movie[0]) }
  end
end

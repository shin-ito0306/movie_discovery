class MoviesController < ApplicationController
  
  def index
    @movie_total_pages = Tmdb::Movie.popular.total_pages
    @page = params[:page_id].to_i
    
    if @movie_total_pages > 10
      first = [1,  @page - 4].max
      @first = [first, @movie_total_pages - 9].min
      last  = [10, @page + 5].max
      @last  = [last, @movie_total_pages].min
      @pages = (@first..@last).each
    else
      @pages = [*1..@last]
    end
    
    @movies = Tmdb::Movie.popular(page: params[:page_id])
  end
  
  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @reviews = Review.where(movie_number: params[:id])
  end
end

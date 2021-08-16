class MoviesController < ApplicationController
  
  def index
    @page = params[:page_id].to_i
    @movie_total_pages = Tmdb::Movie.popular.total_pages
    @movies = Tmdb::Movie.popular(page: params[:page_id])
  end
  
  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @reviews = Review.where(movie_number: params[:id])
    movie_genre = @movie['genres'].map { |x| x['id'] }
    standard_genre_movies = Tmdb::Genre.movies(movie_genre[0])
    compare_movies = standard_genre_movies['results'].map { |sgm| [sgm['id'], sgm['genre_ids']] }
    @y = []
    k = 0
    compare_movies.each do |compare_movie|
      k = 0
      movie_genre.count.times do |i|
        if compare_movie[1].include?(movie_genre[i])
          k += 1
          if k == movie_genre.count
            @y << compare_movie
          end
        end
      end
    end
    
    @recommend_movies = []
    @y.each do |recommend_movie|
      @recommend_movies << Tmdb::Movie.detail(recommend_movie[0])
    end
  end
end

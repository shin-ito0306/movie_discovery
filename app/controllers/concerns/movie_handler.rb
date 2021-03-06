module MovieHandler
  extend ActiveSupport::Concern
  
  def recommend_movies(movie)
    chosen_movies = []
    while (chosen_movies.count < 3) do
      compare_movies(movie).each do |compare_movie|
        matching_count = 1
        (1..movie_genres(movie).count).each do |i|
          if compare_movie[1].include?(movie_genres(movie)[i])
            matching_count += 1
            if matching_count == movie_genres(movie).count && compare_movie[0] != movie['id']
              chosen_movies << compare_movie
            end
          end
        end
        break if chosen_movies.count == 3
      end
    end
    chosen_movies
  end
  
  
  private
  def movie_genres(movie)
    movie['genres'].map { |genre| genre['id'] }
  end
  
  
  def compare_movies(movie)
    standard_genre_movies = Tmdb::Genre.movies(movie_genres(movie)[0], page: rand(1..500))
    standard_genre_movies['results'].map { |sgm| [sgm['id'], sgm['genre_ids']] }
  end
end



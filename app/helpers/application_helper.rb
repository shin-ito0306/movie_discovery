module ApplicationHelper
  def genre_search
    @genres_all = Genre.all
    @genres = []
    @genres_all.each do |genre|
      one_genre = [genre.genre_name, genre.genre_number]
      @genres << one_genre
    end
    return @genres
  end
end

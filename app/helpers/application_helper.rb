module ApplicationHelper
  def genre_search
    @genres_all = Genre.all
    @genres = []
    @genre_type.each do |genre|
      one_genre = [genre.genre_name, genre.genre_number]
      @genre_type << one_genre
    end
    return @genres
  end
end

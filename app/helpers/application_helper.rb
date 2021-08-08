module ApplicationHelper
  def genre_search
    genres_all = Genre.all
    genres = []
    genres_all.each do |genre|
      one_genre = [genre.genre_name, genre.genre_number]
      genres << one_genre
    end
    return genres
  end
  
  #ページネーション
  def pagenation(page, movie_total_pages)
    if movie_total_pages > 10
      first1 = [1,  page - 4].max
      first2 = [first1, movie_total_pages - 9].min
      last1  = [10, page + 5].max
      last2  = [last1, movie_total_pages].min
      return (first2..last2)
    else
      return [*1..movie_total_pages]
    end
  end
end

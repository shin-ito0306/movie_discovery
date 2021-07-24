class SearchesController < ApplicationController
  def search
    @kind = params[:kind]
    @genre = params[:genre]
    if params[:kind] == "会員" && params[:word] != nil
      @members = Member.finder(params[:word])
    elsif params[:kind] == "作品" && params[:word] != nil
      redirect_to searches_word_search_path(word_name: params[:word])
    elsif params[:kind] == "検索の種類" && params[:genre] != nil && params[:word] == ""
      redirect_to searches_genre_search_path(genre_name: params[:genre])
    elsif params[:kind] == "検索の種類" && params[:word] != nil
      redirect_to searches_word_search_path(word_name: params[:word])
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def genre_search
    @genre = params[:genre_name] #searchアクションからのパラメーターと次のページをクリックしたときに送られるのパラメーター
    
    #ページネーション
    @movie_total_pages = Tmdb::Genre.movies(@genre).total_pages
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
    
    if params[:page_id].to_i < 501 #検索した1ページ目はparams[:page_id]はnil(0), 2ページ目以降で使う
      @movies = Tmdb::Genre.movies(@genre, page: params[:page_id])
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def word_search
    @word = params[:word_name] #searchアクションからのパラメーターと次のページをクリックしたときに送られるのパラメーター
    
    if Tmdb::Search.movie(@word).exists?
      @movie_total_pages = Tmdb::Search.movie(@word).total_pages
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
      
      if @movie_total_pages > params[:page_id].to_i
        @movies = Tmdb::Search.movie(@word, page: params[:page_id])
      else
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
end

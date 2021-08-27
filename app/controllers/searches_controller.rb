class SearchesController < ApplicationController
  def search
    if params[:kind] == "会員" && params[:word] != nil
      @members = Member.finder(params[:word])
    elsif params[:kind] == "作品" && params[:word].present?
      redirect_to searches_word_search_path(word_name: params[:word])
    elsif params[:kind].empty? && params[:genre].present? && params[:word].empty?
      redirect_to searches_genre_search_path(genre_name: params[:genre])
    elsif params[:kind].empty? && params[:word].present?
      redirect_to searches_word_search_path(word_name: params[:word])
    else
      redirect_back(fallback_location: movies_path)
    end
  end
  
  def genre_search
    @genre = params[:genre_name] #searchアクションからのパラメーターと次のページをクリックしたときに送られるのパラメーター
    
    #ページネーション
    @movie_total_pages = Tmdb::Genre.movies(@genre).total_pages
    @page = params[:page_id].to_i
    if params[:page_id].to_i < 501 #検索した1ページ目はparams[:page_id]はnil(0), 2ページ目以降で使う
      @movies = Tmdb::Genre.movies(@genre, page: params[:page_id])
    else
      flash[:alert] = "ページ数の上限が超えています"
      redirect_back(fallback_location: movies_path)
    end
  end
  
  def word_search
    @word = params[:word_name] #searchアクションからのパラメーターと次のページをクリックしたときに送られるのパラメーター
    @movie_total_pages = Tmdb::Search.movie(@word).total_pages
    @page = params[:page_id].to_i
    
    if @movie_total_pages > params[:page_id].to_i
      @movies = Tmdb::Search.movie(@word, page: params[:page_id])
    else
      redirect_back(fallback_location: movies_path)
    end
  end
  
end

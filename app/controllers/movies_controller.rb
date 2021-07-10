class MoviesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("94994320f0fad90cdb38b981b4b4af29")
  Tmdb::Api.language("ja")
  
  def index
    @moviedata = JSON.parse((Tmdb::Discover.movie).to_json)
    #@a = JSON.parse(Tmdb::Movie.detail((@moviedata['table']['results'][0]['table']['id']).to_i).to_json)
    
    #取ってきた値から作品1つずつのtitle,idを二次元配列にする
    @movies = Array.new
    a = 0
    while (a < 9) do
      movie_detail = Array.new
      movie_detail << @moviedata['table']['results'][a]['table']['title']
      movie_detail << @moviedata['table']['results'][a]['table']['id']
      @movies << movie_detail
      a += 1
    end
  end
end

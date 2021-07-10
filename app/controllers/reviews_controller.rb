class ReviewsController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("94994320f0fad90cdb38b981b4b4af29")
  Tmdb::Api.language("ja")
  
  def index
    @a = JSON.parse((Tmdb::Search.movie("Harry")).to_json)
    @b = JSON.pretty_generate(@a)
  end
end

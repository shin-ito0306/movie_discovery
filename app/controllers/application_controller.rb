class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_member!, except: [:top, :about]
  
  require 'themoviedb-api'
  Tmdb::Api.key(ENV['API_KEY'])
  Tmdb::Api.language("ja")
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :member_image, :introduction])
  end
  
  def after_sign_up_path_for(resource) 
    movies_path
  end
  
  def after_sign_in_path_for(resource) 
    reviews_path
  end
  
  
  
end

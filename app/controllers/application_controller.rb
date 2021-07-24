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
  
end

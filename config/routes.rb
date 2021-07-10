Rails.application.routes.draw do
  root :to => "homes#top"
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members do
    resource :relationships, only: [:create, :destroy]
    get 'follower' => 'relationships#follower'
    get 'followed' => 'relationships#followed'
  end
end

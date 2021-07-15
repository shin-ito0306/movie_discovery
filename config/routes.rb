Rails.application.routes.draw do
  get 'unsubscribe' => 'homes#unsubscribe'
  get 'withdrawal' => 'homes#withdrawal'
  get 'searches/search' => 'searches#search'
  root :to => "homes#top"
  devise_for :members, controllers: {
    passwords: 'members/passwords',
    registrations: 'members/registrations',
    sessions: 'members/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members do
    get 'see_laters' => 'see_laters#index'
    resource :see_laters, only: [:create, :destroy]
    resource :relationships, only: [:create, :destroy]
    get 'follower' => 'relationships#follower'
    get 'followed' => 'relationships#followed'
  end
  resources :movies, only: [:index, :show]
  resources :reviews
end

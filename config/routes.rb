Gallery::Application.routes.draw do

  root to: "products#index"

  get "signup" => "users#new", as: "signup"
  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  get "favorites" => "users#favorites", as: "favorites"

  get "tags/:tag", to: "products#index", as: :tag
  match '/users/favorites', :controller => 'users', :action => 'favorites'

  resources :users
  resources :sessions
  resources :products

end

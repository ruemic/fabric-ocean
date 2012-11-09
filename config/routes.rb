Gallery::Application.routes.draw do

  root to: "products#index"

  get "signup" => "users#new", as: "signup"
  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"

  get "tags/:tag", to: "products#index", as: :tag
  match '/users/favorites', :controller => 'users', :action => 'favorites'
  match '/favorites/:user_id/:product_id', :controller => 'favorites', :action => 'destroy'


  resources :users
  resources :sessions
  resources :products
  resources :favorites

end

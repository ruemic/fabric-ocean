Gallery::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions

  get 'tags/:tag', to: 'products#index', as: :tag
  resources :products

  root to: 'products#index'
end

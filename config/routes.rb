Gallery::Application.routes.draw do

  root to: "main#index"

  # root to: "products#index"

  get "signup" => "users#new", as: "signup"
  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"

  get "old" => "products#index"

  get "tags/:tag", to: "products#index", as: :tag
  match '/users/favorites', :controller => 'users', :action => 'favorites'
  match '/favorites/:user_id/:product_id', :controller => 'favorites', :action => 'destroy'


  resources :users
  resources :sessions
  resources :favorites

  scope "api" do
    get "tags/:tag", to: "products#index", as: :tag
    resources :products
    resources :favorites
  end

end

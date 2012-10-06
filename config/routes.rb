Gallery::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  devise_for :users, :controllers => {:registrations => "users/registrations"}


  get 'tags/:tag', to: 'products#index', as: :tag
  resources :products

  root to: 'products#index'
end

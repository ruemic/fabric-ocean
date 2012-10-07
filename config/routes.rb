Gallery::Application.routes.draw do

  get 'tags/:tag', to: 'products#index', as: :tag
  resources :products

  root to: 'products#index'
end

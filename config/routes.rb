Rails.application.routes.draw do
  get 'carts/show'
  get 'carts', to: 'carts#show'
  post 'carts/add'
  post 'carts/remove'
  post 'carts/checkout'
  resources :products, only: [:show, :index]
  resources :payments, only: [:show, :index]
  devise_for :users
  root "main#home"
end

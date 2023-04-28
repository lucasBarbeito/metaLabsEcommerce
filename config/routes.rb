Rails.application.routes.draw do
  resources :cart_products
  resources :carts
  devise_for :users
  post 'carts/add'

  resources :products, only: [:show, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#home"
end

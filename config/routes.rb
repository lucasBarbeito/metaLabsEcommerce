Rails.application.routes.draw do
  devise_for :users

  resources :products, only: [:show, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#home"
end

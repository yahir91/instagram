Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :comments, only: [:create, :destroy]
  resources :users, only: [:show]

  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  post "toggle_like", to: "likes#toggle_like", as: :toggle_like
end

Rails.application.routes.draw do
  get 'about/index'
  get 'about' => 'about#index'

  resources :books
  resources :authors
  resources :categories
  resources :publishers

  root 'books#index'
end

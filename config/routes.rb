Rails.application.routes.draw do
  # get 'deliveries/index'
  # get 'deliveries/new'
  # get 'deliveries/show'
  devise_for :users

  resources :home, only: [:index]
  resources :products, only: [:index, :show]
  resources :categories, only: :show
  resources :cart
  resources :cart_items
  resources :order
  resources :order_items
  resources :deliveries
  resources :histories, only: [:index]
  
  root 'home#index'

  namespace :admin do
    resources :home, only: [:index]
    resources :users
  end
end

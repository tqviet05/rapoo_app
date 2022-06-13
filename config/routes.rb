Rails.application.routes.draw do
  # get 'deliveries/index'
  # get 'deliveries/new'
  get 'users/order'
  get 'users/address'
  devise_for :users

  resources :home, only: [:index]
  resources :products, only: [:index, :show]
  resources :categories, only: :show
  resources :cart, only: :index
  resources :cart_items, only: [:create, :update, :destroy]
  resources :order, only: [:new, :create]
  resources :order_items, only: :create
  # resources :deliveries, only: :index
  resources :histories, only: [:index]
  resources :users, only: [:show, :update, :edit]

  
  root 'home#index'

  namespace :admin do
    resources :home, only: [:index]
    resources :users
  end
end

Rails.application.routes.draw do
  resources :product_attachments
  # get 'deliveries/index'
  # get 'deliveries/new'
  get 'users/order'
  get 'users/address'
  devise_for :users
  devise_for :admin


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
    resources :users, only: [:index, :edit, :new, :create, :update, :destroy]
    resources :orders,only: [:index, :edit, :update, :destroy]
    resources :categories, only: [:index, :edit, :new, :create, :update, :destroy]
    resources :banners, only: [:index, :new, :create, :destroy]
    resources :products, only: [:index, :edit, :new, :create, :update, :destroy]
  end
end

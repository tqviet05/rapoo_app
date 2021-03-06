Rails.application.routes.draw do
  # get 'deliveries/index'
  # get 'deliveries/new'
  # get 'deliveries/show'
  devise_for :users

  resources :home, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :categories, only: :show
  resources :cart
  resources :cart_items
  resources :order
  resources :order_items
  resources :deliveries
  resources :histories, only: [:index]
  
  root 'home#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

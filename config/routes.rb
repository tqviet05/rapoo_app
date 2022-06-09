Rails.application.routes.draw do
  devise_for :users

  resources :home, only: [:index, :create]
  resources :products, only: [:index, :show]
  resources :categories, only: :show
  resources :cart
  resources :cart_items
  resources :order
  resources :order_items
  
  root 'home#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users

  # get 'categories/show'
  # get 'categories/index'
  # get 'products/show'
  # get 'products/index'
  # get 'home/index'
  # get 'home/details'
  # get 'home/login'
  resources :home#, only: [:index, :create]
  resources :products, only: [:index, :show]
  resources :categories, only: :show
  root 'home#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

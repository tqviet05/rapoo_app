Rails.application.routes.draw do
  resources :product_attachments
  # get 'deliveries/index'
  # get 'deliveries/new'
  get 'users/order'
  devise_for :users

  resources :home, only: [:index]
  resources :products, only: [:index, :show]
  resources :categories, only: :show
  resources :cart, only: :index
  resources :cart_items, only: [:create, :update, :destroy]
  resources :order, only: [:new, :create]
  # resources :order_items, only: :create
  resources :deliveries, only: [:destroy, :edit, :create, :update, :index, :new]
  resources :histories, only: [:index]
  resources :users, only: [:show, :update, :edit, :new]

  # get "*path", to: "application#page_404"

  root 'home#index'

  namespace :admin do
    devise_for :admin_users do
      # get 'sign_in', to: 'devise/sessions#new'
      # delete 'sign_out', to: 'admin/sessions#destroy'
    end

    resources :home, only: [:index]
    resources :users, only: [:index, :edit, :new, :create, :update, :destroy]
    resources :orders
    resources :categories, only: [:index, :edit, :new, :create, :update, :destroy]
    resources :banners, only: [:index, :new, :create, :destroy]
    resources :products, only: [:index, :edit, :new, :create, :update, :destroy]
  end
end
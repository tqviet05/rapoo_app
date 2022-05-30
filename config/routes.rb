Rails.application.routes.draw do
  get 'rapoo_app/index'
  get 'rapoo_app/details'
  get 'rapoo_app/login'
  root 'rapoo_app#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

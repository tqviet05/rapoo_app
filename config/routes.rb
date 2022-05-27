Rails.application.routes.draw do
  get 'rapoo_app/home'
  root 'rapoo_app#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

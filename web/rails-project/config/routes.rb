Rails.application.routes.draw do
  get 'users/logout', as: :logout
  resources :users
  get 'welcome/index'
  get 'welcome/result'
  post 'welcome/result'
  get 'welcome/cached'

  root 'users#login', via: %i[get post], as: :login
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

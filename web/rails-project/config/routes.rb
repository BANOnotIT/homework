Rails.application.routes.draw do
  match 'auth/register', via: %i[post get], as: :register
  match 'auth/login', via: %i[post get], as: :login
  get 'auth/logout', as: :logout
  resources :users
  get 'welcome/index'
  get 'welcome/result'
  post 'welcome/result'
  get 'welcome/cached'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

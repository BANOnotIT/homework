Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/result'
  post 'welcome/result'
  get 'welcome/cached'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

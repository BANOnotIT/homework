Rails.application.routes.draw do
  get 'proxy/index'
  get 'proxy/output'


  root 'proxy#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

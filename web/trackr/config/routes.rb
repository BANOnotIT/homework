# frozen_string_literal: true

Rails.application.routes.draw do
  resources :time_entries
  get 'time_entries/current(.:format)'
  resources :time_entries, except: %i[new edit]
  devise_for :users

  root 'time_entries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

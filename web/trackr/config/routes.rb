# frozen_string_literal: true

Rails.application.routes.draw do
  get 'time_entries/active(.:format)', to: 'time_entries#active', as: :active_time_entry
  resources :time_entries, except: %i[new]
  devise_for :users

  root 'time_entries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :items, only: %i[index new create edit update destroy]
  end
  root 'items#index'
  resources :items

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

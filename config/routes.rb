# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  get 'orders/index'
  get 'orders/show'
  namespace :admin do
    resources :items, only: %i[index new create edit update destroy]
  end
  resources :items

  resources :carts

  resources :orders, only: [:index,:show,:create]

  post 'promo_codes/discount'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

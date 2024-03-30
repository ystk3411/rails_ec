# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'

  namespace :admin do
    resources :items, only: %i[index new create edit update destroy]
  end
  resources :items

  resources :carts

  resources :orders, only: %i[index show create]

  post 'promo_codes/discount'

  post 'promo_codes/cancel'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

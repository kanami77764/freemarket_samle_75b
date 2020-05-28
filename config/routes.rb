Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:index, :new]
  resources :items, only: [:new, :show]
  resources :buyers, only: :index
  # resources :items, only: :new
end

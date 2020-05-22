Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:index, :new]
  resources :buyers, only: :index
end

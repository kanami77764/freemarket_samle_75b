Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:index, :new]
  resources :items, only: [:show, :new]
  resources :buyers, only: :index
  
  resources :items do 
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end

end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  root 'items#index'
  
  resources :users, only: [:index, :new]
  resources :items, only: [:new, :show, :destroy]
  resources :users, only: [:index, :new, :edit]
  resources :items, only: [:show, :new]
  resources :buyers, only: :index

  resources :items do 
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end

end

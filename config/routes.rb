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
  resources :users, only: [:index, :new, :edit]
  resources :buyers, only: :index
  resources :items do
    collection do
      get 'search'
    end 
  end
end
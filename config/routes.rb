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
  
  resources :items do
    collection do
      get 'search'
    end 
    
  resources :users, only: [:index, :new, :edit]

  resources :items, only: [:new, :show, :create, :destroy] do 
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :buyers, only: :index do
      collection do
        get 'index', to: 'buyers#index'
        post 'pay', to: 'buyers#pay'
        get 'done', to: 'buyers#done'
      end
    end
  end

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end



end


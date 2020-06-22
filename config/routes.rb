Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  resources :users, only: [:show, :index] do
    resources :friend_requests, only: [:index, :create, :update, :destroy]
  end

  resources :posts do 
    resources :comments, only: [:create]
  end
  resources :comments, only: [:update]

  resources :friendships, only: [:destroy]
end

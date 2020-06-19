Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index] do
    resource :profile
  end
  resources :posts do 
    resources :comments, only: [:create, :destroy]
  end
  root to: 'posts#index'
end

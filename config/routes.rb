Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end
  resources :followings, only: [:create, :destroy]
  resources :tweets, only: [:create, :destroy]
end

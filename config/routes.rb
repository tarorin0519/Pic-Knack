Rails.application.routes.draw do
  root 'home#top'
  get '/about' => "home#about"

  devise_for :admin_accounts, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers:{
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  }

  resources :users do
    member do
     get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :posts do
    resource :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :genres, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

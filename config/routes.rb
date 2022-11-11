# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users 
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
    # devise_for :users, controllers: { confirmations: 'users/confirmations' }
  root to: 'users#index'
  get 'api/user/:id/posts' => 'users#api_user_post', format: 'json'
  get 'api/post/:id/comments' => 'posts#post_comments_api', format: 'json'  
  post 'api/post/:id/comments' => 'comments#post_create_api'

end

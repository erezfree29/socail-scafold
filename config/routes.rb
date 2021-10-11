Rails.application.routes.draw do
  mount API::Base, at: "/"
  root 'posts#index'

  devise_for :users

  get '/posts/:post_comments', to: 'posts# post_comments'

  resources :users, only: [:index, :show] do
    post '/request/', to: 'users#friend_request'
    put '/approve/:friend_id', to: 'users#approve'
    delete '/approve/:friend_id', to: 'users#approve'
  end
  
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

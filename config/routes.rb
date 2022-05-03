Rails.application.routes.draw do
  resources :posts
  resources :users

  # root 'home#index'
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  
  get '/all_posts', to: 'posts#index'
  get '/my_posts', to: 'posts#user_posts'

  get '/follow/:id', to: 'follow#follow_user'


end

Rails.application.routes.draw do
  resources :users

  # root 'home#index'
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  



end

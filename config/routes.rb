Rails.application.routes.draw do

  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'
  get '/bike-shop', to: 'bike_shop#index'
  post '/cart', to: 'cart#create'
  get '/cart', to: 'cart#index'
  delete '/cart', to: 'cart#destroy'

  namespace :admin do
    resources :conditions, exclude: [:index, :show]
    resources :stations
    resources :trips
  end

  resources :stations
  resources :users
  resources :trips, only: [:index, :show]
  resources :conditions, only: %i[index show]
  resources :accessory, only: [:show]
end

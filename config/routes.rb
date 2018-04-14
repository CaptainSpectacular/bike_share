Rails.application.routes.draw do

  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'learn-dashboard', to: 'learn#index'
  get '/conditions-dashboard', to: 'conditions/dashboard#index'
  get '/trips-dashboard', to: 'trips/dashboard#index'
  get '/dashboard', to: 'users#show'

  get '/admin/dashboard', to: 'admin/dashboard#index'
  get '/admin/bike-shop', to: 'admin/bike_shop#index'
  get '/admin/bike-shop/new',to: 'admin/bike_shop#new'
  get '/bike-shop', to: 'bike_shop#index'
  post '/cart', to: 'cart#create'
  get '/cart', to: 'cart#index'
  delete '/cart', to: 'cart#destroy'

  namespace :admin do
    resources :conditions, exclude: [:index, :show]
    resources :stations
    resources :trips
    resources :accessories
  end

  resources :stations
  resources :users
  resources :trips, only: [:index, :show]
  resources :conditions, only: [:index, :show]
  resources :accessory, only: [:show]
  resources :orders
end

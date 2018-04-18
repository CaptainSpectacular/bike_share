Rails.application.routes.draw do

  root   'welcome#index'
  get    '/login',                to: 'sessions#new'
  post   '/login',                to: 'sessions#create'
  get    '/logout',               to: 'sessions#destroy'
  get    'learn-dashboard',       to: 'learn#index'
  get    '/dashboard',            to: 'users#show'
  get    '/bike-shop',            to: 'bike_shop#index'
  post   '/cart',                 to: 'cart#create'
  get    '/cart',                 to: 'cart#index'
  delete '/cart',                 to: 'cart#destroy'
  get    '/conditions-dashboard', to: 'conditions/dashboard#index'
  get    '/trips-dashboard',      to: 'trips/dashboard#index'
  get    '/stations-dashboard',   to: 'stations/dashboard#index'

  resources :stations
  resources :users
  resources :orders
  resources :trips,      only: %i[index show]
  resources :conditions, only: %i[index show]
  resources :accessory,  only: %i[show]

  namespace :admin do
    get '/bike-shop',     to: 'bike_shop#index'
    get '/dashboard',     to: 'dashboard#index'
    get '/bike-shop/new', to: 'bike_shop#new'

    resources :stations
    resources :trips
    resources :accessories
    resources :conditions, exclude: %i[index show]
  end
end

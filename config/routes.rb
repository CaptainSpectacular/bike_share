Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'user#show'

  namespace :admin do
    resources :conditions, exclude: %i[index show]
    resources :stations
    resources :trips, only: [:new, :edit, :update, :destroy]
  end
  
  resources :stations
  resources :trips, only: [:index, :show]
  resources :conditions, only: %i[index show]

end

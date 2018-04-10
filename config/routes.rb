Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'user#show'

  resources :stations
  namespace :admin do
    resources :stations
    resources :trips, only: [:new, :edit, :update, :destroy]
  end

  resources :trips, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  root 'users#new'

  resources :games do
    resources :shots, shallow: true, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :show]
  resources :sessions

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end

Rails.application.routes.draw do

  root 'users#new'

  resources :games do
    resources :shots, shallow: true, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :show]
end

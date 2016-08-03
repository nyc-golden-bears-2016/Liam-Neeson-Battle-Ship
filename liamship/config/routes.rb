Rails.application.routes.draw do

  root 'users#new'

  resources :games do
    resources :shots, shallow: true, except: :index
  end

  resources :users, only: [:new, :create, :show]
end

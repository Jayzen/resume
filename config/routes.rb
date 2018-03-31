Rails.application.routes.draw do
  root 'welcomes#index'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users,               only: [:edit, :update]
  resources :password_alters,     only: [:edit, :update]
  resources :portraits,           only: [:new, :create, :update] 
  resources :projects
  resources :skills
  resources :educations
  resources :experiences 
end

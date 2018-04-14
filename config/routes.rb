Rails.application.routes.draw do
  root 'welcomes#index'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get "/auth/:provider/callback" => "sessions#create"
  delete '/logout',  to: 'sessions#destroy'
  resources :users,               only: [:edit, :update]
  resources :password_alters,     only: [:edit, :update]
  resources :portraits,           only: [:new, :create, :update] 
  resources :projects
  resources :skills
  resources :educations
  resources :experiences 
  resources :socials
  resources :wechats
  resources :set_templates
  resources :pdf_resumes
  get "welcomes/set_zh", as: :set_zh
  get "welcomes/set_en", as: :set_en
  get "welcomes/set_language", as: :set_language
  get ":user_name", to: "welcomes#show", as: :online
end

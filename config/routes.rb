Rails.application.routes.draw do
  root 'welcomes#index'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get "/auth/:provider/callback" => "sessions#create"
  delete '/logout',  to: 'sessions#destroy'
  resources :users,               only: [:edit, :update]
  resources :password_alters,     only: [:edit, :update]
  resources :portraits,           only: [:new, :create, :update] 
  resources :projects do
    get :published, on: :member
  end
  resources :skills
  resources :educations
  resources :experiences 
  resources :socials
  resources :papers
  resources :wechats
  resources :set_templates, only: [:edit, :update]
  resources :set_modules, only: [:edit, :update]
  resources :pdf_resumes
  get "welcomes/set_zh", as: :set_zh
  get "welcomes/set_en", as: :set_en
  get "resume_information", to: "resume_information#show", as: :resume_information
  get ":name_en", to: "welcomes#show", as: :online
end

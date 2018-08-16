Rails.application.routes.draw do
  root 'welcomes#index'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get "/auth/:provider/callback" => "sessions#create"
  delete '/logout',  to: 'sessions#destroy'
  resources :users, :password_alters, :set_templates, :set_modules, only: [:edit, :update]
  resources :portraits, only: [:new, :create, :update] 
  resources :projects, :skills, :educations, :experiences, :socials, :papers, :pdf_resumes, :wechats do
    get :published, on: :member
  end
  get "welcomes/set_zh", as: :set_zh
  get "welcomes/set_en", as: :set_en
  get "resume_information", to: "resume_information#show", as: :resume_information
  get ":name_en", to: "welcomes#show", as: :online
  get "pdf_onlines/lists", as: :pdf_lists
  get "pdf_onlines/set_pdf", as: :set_pdf
end

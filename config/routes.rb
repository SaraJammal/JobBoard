Rails.application.routes.draw do

root 'jobs#index'
resources :jobs
resources :job_applications
resources :categories
devise_for :users

# root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

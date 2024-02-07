Rails.application.routes.draw do
  devise_for :users
  root :to => 'tasks#index'
  get 'login', to: 'users#new', as: 'new_users'
  post 'login', to: 'users#create', as: 'create_users'
  get 'logout', to: 'users#destroy', as: 'destroy_users'

  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:new, :show, :edit, :create, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end

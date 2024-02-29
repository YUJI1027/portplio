Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  devise_for :users  

  resources :tasks do
    resource :likes, only: [:create, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end

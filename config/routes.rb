Rails.application.routes.draw do
  devise_for :users  
  root to: 'tasks#new'
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]


  resources :tasks do
    resource :likes, only: [:create, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end

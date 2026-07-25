Rails.application.routes.draw do
  # Micropost Project
  root   "static_pages#home"
  get    "/help",    to: "static_pages#help"
  get    "/about",   to: "static_pages#about"
  get    "/contact", to: "static_pages#contact"
  get    "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :users do
    member do
      get :following
      get :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  get "/microposts", to: "static_pages#home"

  # Tailwind CSS Practice Projects
  get "loopstudios", to: "static_pages#loopstudios"
  get "shortly", to: "static_pages#shortly"

  get "up" => "rails/health#show", as: :rails_health_check
end

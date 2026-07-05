Rails.application.routes.draw do
  get "sessions/new"
  get "users/new"
  resources :users

  # Micropost Project
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"

  # Tailwind CSS Practice Projects
  get "loopstudios", to: "static_pages#loopstudios"
  get "shortly", to: "static_pages#shortly"

  get "up" => "rails/health#show", as: :rails_health_check
end

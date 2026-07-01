Rails.application.routes.draw do
  resources :users

  # Micropost Project
  root "static_pages#home"
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "static_pages/contact"

  # Tailwind CSS Practice Projects
  get "loopstudios", to: "static_pages#loopstudios"
  get "shortly", to: "static_pages#shortly"

  get "up" => "rails/health#show", as: :rails_health_check
end

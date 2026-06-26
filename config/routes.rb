Rails.application.routes.draw do
  resources :users

  get "home", to: "static_pages#home"
  get "loopstudios", to: "static_pages#loopstudios"
  get "shortly", to: "static_pages#shortly"

  root "static_pages#shortly"

  get "up" => "rails/health#show", as: :rails_health_check
end

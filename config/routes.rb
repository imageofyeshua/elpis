Rails.application.routes.draw do
  resources :users

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "loopstudios", to: "static_pages#loopstudios"
  get "shortly", to: "static_pages#shortly"

  root "static_pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end

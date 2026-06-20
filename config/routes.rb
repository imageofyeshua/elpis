Rails.application.routes.draw do
  get "home", to: "static_pages#home"
  get "about", to: "static_pages#about"
  get "help", to: "static_pages#help"

  root "static_pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end

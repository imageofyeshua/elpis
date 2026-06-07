Rails.application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"

  root "static_pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end

Rails.application.routes.draw do
  resources :users

  root "application#hello"

  get "up" => "rails/health#show", as: :rails_health_check

end

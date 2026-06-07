Rails.application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  resources :microposts
  resources :users

  root "users#index"

  get "up" => "rails/health#show", as: :rails_health_check

end

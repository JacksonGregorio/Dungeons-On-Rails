Rails.application.routes.draw do
  
  root to: "players#index"
  post "players/create", to: "players#create"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :players
end

Rails.application.routes.draw do
  
  get "players", to: "players#index"
  post "players/create", to: "players#create"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :players
end

Rails.application.routes.draw do

  get "players", to: "players#index"
  get "up" => "rails/health#show", as: :rails_health_check

end

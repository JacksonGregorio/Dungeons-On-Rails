Rails.application.routes.draw do
  #login user
  resources :player, param: :_username
  post '/auth/login', to: 'authentication#login'


  #routes
  root to: "players#index"
  post "players/create", to: "players#create"
  get '/*a', to: 'application#not_found'
  get "up" => "rails/health#show", as: :rails_health_check
end

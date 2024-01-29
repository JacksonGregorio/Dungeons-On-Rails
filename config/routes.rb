Rails.application.routes.draw do
  #login user
  resources :player, param: :_username
  post '/auth/login', to: 'authentication#login'


  #routes
  root to: "players#index"

  #auth routes
  get "/login", to: "authentication#login"

  #player routes
  get "players/new", to: "players#new"
  post "player/create", to: "players#create"
  post "player/update", to: "players#update"
  get '/*a', to: 'application#not_found'
  get "up" => "rails/health#show", as: :rails_health_check
end

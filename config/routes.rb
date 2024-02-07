Rails.application.routes.draw do
  #login user
  resources :player, param: :_username
  post '/auth/login', to: 'authentication#login'

  #routes
  root to: "players#index"

  #auth routes
  get "/login", to: "authentication#loginform"

  #player routes
  get "players/index", to: "players#index"
  get "players/new", to: "players#new"
  post "player/create", to: "players#create"
  post "player/update", to: "players#update"
  get "player/:id", to: "players#show"
  get "player/:id/edit", to: "players#edit"
  delete "player/:id", to: "players#destroy"

  #character routes
  get "characters/index", to: "characters#index"
  get "characters/new", to: "characters#new"
  post "character/create", to: "characters#create"
  post "character/update", to: "characters#update"
  get "character/:id", to: "characters#show"
  get "character/:id/edit", to: "characters#edit"
  get "character/filter", to: "characters#filter_characters_by_player"
  delete "character/:id", to: "characters#destroy"

  #backpack routes
  get "backpacks/index", to: "backpacks#index"
  get "backpacks/new", to: "backpacks#new"
  post "backpack/create", to: "backpacks#create"
  post "backpack/update", to: "backpacks#update"
  get "backpack/:id", to: "backpacks#show"
  get "backpack/:id/edit", to: "backpacks#edit"
  delete "backpack/:id", to: "backpacks#destroy"

  #ability routes
  get "abilities/index", to: "abilities#index"
  get "abilities/new", to: "abilities#new"
  post "ability/create", to: "abilities#create"
  post "ability/update", to: "abilities#update"
  get "ability/:id", to: "abilities#show"
  get "ability/:id/edit", to: "abilities#edit"
  delete "ability/:id", to: "abilities#destroy"

  #item routes
  get "items/new", to: "items#new"
  post "item/create", to: "items#create"
  post "item/update", to: "items#update"
  get "item/:id", to: "items#show"
  get "item/:id/edit", to: "items#edit"
  delete "item/:id", to: "items#destroy"

  #spell routes
  get "spells/new", to: "spells#new"
  post "spell/create", to: "spells#create"
  post "spell/update", to: "spells#update"
  get "spell/:id", to: "spells#show"
  get "spell/:id/edit", to: "spells#edit"
  delete "spell/:id", to: "spells#destroy"

  #backpck routes
  get "backpacks/new", to: "backpacks#new"
  post "backpack/create", to: "backpacks#create"
  post "backpack/update", to: "backpacks#update"
  get "backpack/:id", to: "backpacks#show"
  get "backpack/:id/edit", to: "backpacks#edit"
  delete "backpack/:id", to: "backpacks#destroy"

  get '/*a', to: 'application#not_found'
  get "up" => "rails/health#show", as: :rails_health_check
end

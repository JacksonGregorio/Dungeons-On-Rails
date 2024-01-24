Rails.application.routes.draw do
  get 'abilities/index'
  get 'abilities/show'
  get 'abilities/new'
  get 'abilities/edit'
  get 'abilities/create'
  get 'abilities/update'
  get 'abilities/destroy'
  get 'spells/index'
  get 'spells/show'
  get 'spells/new'
  get 'spells/edit'
  get 'spells/create'
  get 'spells/update'
  get 'spells/destroy'
  get 'backpacks/index'
  get 'backpacks/show'
  get 'backpacks/new'
  get 'backpacks/edit'
  get 'backpacks/create'
  get 'backpacks/update'
  get 'backpacks/destroy'
  get 'characters/index'
  get 'characters/show'
  get 'characters/new'
  get 'characters/edit'
  get 'characters/create'
  get 'characters/update'
  get 'characters/destroy'
  get 'players/index'
  get 'players/show'
  get 'players/new'
  get 'players/edit'
  get 'players/create'
  get 'players/update'
  get 'players/destroy'
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  get 'items/create'
  get 'items/update'
  get 'items/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

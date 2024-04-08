require 'api_constraints'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :kittens
    end

    scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
      resources :kittens
    end
  end

  resources :kittens
  root "kittens#index"
end

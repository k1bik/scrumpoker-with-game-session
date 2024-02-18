Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "games#index"

  resource :user, only: %i[show new]
  resource :session, only: %i[new create]
  resources :games
end

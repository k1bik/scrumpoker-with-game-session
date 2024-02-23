Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "poker_sessions#index"

  resource :user, only: %i[show new create] do
    resource :password, only: %i[new update] do
      collection do
        get :validate
      end
    end
  end
  resource :session, only: %i[new create destroy]
  resources :poker_sessions
end

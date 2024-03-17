Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "poker_sessions#index"

  resource :user, only: %i[show new create] do
    resource :password, only: %i[new update]
  end
  resource :session, only: %i[new create destroy]
  resources :poker_sessions

  get "/validate_login_form", to: "validates#validate_login_form", as: "validate_login_form"
  get "/validate_sign_up_form", to: "validates#validate_sign_up_form", as: "validate_sign_up_form"
  get "/validate_user_password_form", to: "validates#validate_user_password_form", as: "validate_user_password_form"
end

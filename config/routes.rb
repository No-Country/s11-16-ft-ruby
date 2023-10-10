Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.

  # Defines the root path route ("/")
  root "home#index"
end

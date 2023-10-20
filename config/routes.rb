Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
    # sessions: 'registrations/sessions'
  }

  resources :users, only: %i[index]
  get "/products/my_products", to: "products#my_products"
  resources :products do
  end
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.

  # Defines the root path route ("/")
  root "products#index"
end

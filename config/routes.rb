Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
    # sessions: 'registrations/sessions'
  }

  resources :users, only: %i[index]
  # do
  #   resources :favorites, only: [:create, :destroy]
  # end

  # resources :products
  resources :products do
    # resources :favorites, only: [:create, :destroy]
    post 'favorite', on: :member, to: 'favorites#create', as: 'favorite'
    delete 'favorite', on: :member, to: 'favorites#destroy'
  end

  # resources :favorites, only: [:index]

  resources :categories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.

  # Defines the root path route ("/")
  root "home#index"
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :islands do
    resources :bookings, only: %i[edit update create] do
      member do
        patch :accept
        patch :decline
      end
    end
  end

  resources :bookings, only: :show do
    resources :reviews, only: %i[create edit update]
  end
  resources :users, only: [:show] 
  resources :reviews, only: %i[destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

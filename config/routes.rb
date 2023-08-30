Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :islands do
    resources :bookings, only: %i[ update new create] do
      member do
        patch :accept
        patch :decline
      end
    end
  end
  resources :bookings, only: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

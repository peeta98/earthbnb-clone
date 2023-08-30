Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :islands do
<<<<<<< HEAD
    resources :bookings, only: %i[ update new create] do
      member do
        patch "decline"
=======
    resources :bookings, only: %i[show update new create] do
      member do
        patch :accept
>>>>>>> master
      end
    end
  end
  resources :bookings, only: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :islands do
    resources :bookings, only: %i[show edit update new create] do
      member do
        patch :accept
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

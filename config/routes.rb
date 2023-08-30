Rails.application.routes.draw do
  devise_for :users
  root to: "ovens#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :ovens do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[destroy index]
end

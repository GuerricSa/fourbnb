Rails.application.routes.draw do
  devise_for :users
  root to: "ovens#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :ovens do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[destroy index]
  patch "bookings/:id/accept", to: "bookings#accept", as: :booking_accept
  patch "bookings/:id/decline", to: "bookings#decline", as: :booking_decline
end

Rails.application.routes.draw do
  devise_for :users
  root to: "ovens#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :oven
end

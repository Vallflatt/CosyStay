Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :flats, only: %i[index show create new] do
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: %i[index]
  # Defines the root path route ("/")
  # root "articles#index"
end

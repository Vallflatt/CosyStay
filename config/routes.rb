Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :flats, only: %i[index show create new]

  resources :bookings, only: %i[new create]
  # Defines the root path route ("/")
  # root "articles#index"
end

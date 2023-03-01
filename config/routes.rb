Rails.application.routes.draw do
  root to: "flats#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :flats, only: %i[index show create new]
  # Defines the root path route ("/")
  # root "articles#index"
end

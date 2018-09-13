Rails.application.routes.draw do
  root "products#index"
  namespace :admin do
    root to: "categories#index"
    resources :categories
    resources :users
  end
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
end

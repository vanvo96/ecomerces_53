Rails.application.routes.draw do
  get "orders/show"
  resources :products
  root "products#index"
  namespace :admin do
    root to: "categories#index"
    resources :categories
    resources :users
    resources :orders
  end
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :carts, :except => [:destroy]
  get "/show_carts", to: "carts#show_cart"
  delete "/destroy_cart", to: "carts#destroy_cart"
  delete "/delete_cart", to: "carts#delete_cart"
  put "/update_cart", to: "carts#update_cart"

  resources :order_details
end

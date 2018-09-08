Rails.application.routes.draw do
  root "static_pages#home"
  namespace :admin do
    root to: "categories#index"
    resources :categories
  end
end

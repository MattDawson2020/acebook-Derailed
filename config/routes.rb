Rails.application.routes.draw do
  get "sessions/new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home", to: "pages#home"
  get "signup", to: "users#new"
  resources :sessions

  post "/login", to: "sessions#create"
  root to: "pages#home"
  resources :posts
  resources :users
end

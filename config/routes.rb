Rails.application.routes.draw do
  get "sessions/new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home", to: "pages#home"
  get "signup", to: "users#new"
  put "/post/:id/like", to: "posts#like", as: "like"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # get '/profile', to: 'users#index', as: 'profile'
  root to: "pages#home"
  resources :posts
  resources :users
  resources :comments
end


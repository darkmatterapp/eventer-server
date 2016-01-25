Rails.application.routes.draw do
  resources :locations
  resources :links
  resources :links
  resources :videos, controller: "media"
  resources :audios, controller: "media"
  resources :photos, controller: "media"
  root "welcome#index"

  # Users + auth
  resources :users, only: [:new, :create, :update, :destroy]
  resources :sessions
  get "signup", to: "users#new", as: "signup"
  get "signin", to: "sessions#new", as: "signin"
  get "signout", to: "sessions#destroy", as: "signout"
  get "dashboard", to: "users#show", as: "dashboard"
  get "settings", to: "users#edit", as: "settings"

  resources :events, :venues, :people, :media, :performances
end

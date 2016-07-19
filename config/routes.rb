Rails.application.routes.draw do
  root "welcome#index"

  # Users + auth
  resources :users, only: [:new, :create, :update, :destroy]
  resources :sessions
  get "signup",    to: "users#new",        as: "signup"
  get "signin",    to: "sessions#new",     as: "signin"
  get "signout",   to: "sessions#destroy", as: "signout"
  get "settings",  to: "users#edit",       as: "settings"
  get "dashboard", to: "users#show",       as: "dashboard"

  resources :events do
    resources :venues do
      resources :locations
    end

    resources :performances
    resources :people
    resources :roles
    resources :rsvps

    resources :links

    resources :videos, controller: "media"
    resources :audios, controller: "media"
    resources :photos, controller: "media"
  end

  resources :media # is this needed?
end

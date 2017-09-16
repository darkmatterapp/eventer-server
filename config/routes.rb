Rails.application.routes.draw do
  root "welcome#index"

  # Users + auth
  resources :users, only: [:new, :create, :update, :destroy]
  resources :auths

  get "signup",    to: "users#new",        as: "signup"
  get "signin",    to: "auths#new",     as: "signin"
  get "signout",   to: "auths#destroy", as: "signout"
  get "settings",  to: "users#edit",       as: "settings"
  get "dashboard", to: "users#show",       as: "dashboard"

  resources :events do
    resources :venues do
      resources :locations
    end

    resources :sessions
    resources :people
    resources :roles
    resources :rsvps
    resources :participations

    resources :links

    resources :videos, controller: "media"
    resources :audios, controller: "media"
    resources :photos, controller: "media"
  end

  resources :media # is this needed?
end

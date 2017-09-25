Rails.application.routes.draw do
  root "welcome#index"

  get "signup",    to: "admin/users#new",     as: "signup"
  get "settings",  to: "admin/users#edit",    as: "settings"
  get "dashboard", to: "admin/users#show",    as: "dashboard"

  get "signin",    to: "admin/auths#new",     as: "signin"
  get "signout",   to: "admin/auths#destroy", as: "signout"

  namespace :admin do

    resources :auths, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create, :update, :destroy]

    resources :events, param: :event_id

    scope 'events/:event_id', as: :event do
      resources :venues do
        resources :locations
      end

      resources :sessions
      resources :participants
      resources :roles
      resources :rsvps
      resources :participations

      resources :links

      resources :videos, controller: "media"
      resources :audios, controller: "media"
      resources :photos, controller: "media"
    end
  end
end

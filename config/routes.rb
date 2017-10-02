Rails.application.routes.draw do
  root "welcome#index"

  get "demo",      to: "welcome#demo",        as: :demo

  get "signup",    to: "admin/users#new",     as: :signup
  get "settings",  to: "admin/users#edit",    as: :settings

  get "signin",    to: "admin/auths#new",     as: :signin
  get "signout",   to: "admin/auths#destroy", as: :signout

  namespace :admin do

    resources :auths, only: [:new, :create, :destroy]
    resources :users, only: [:index, :new, :create, :update, :destroy]

    resources :events, param: :event_id

    scope 'events/:event_id', as: :event do
      get "/preview", to: "events#preview", as: :preview

      resources :venues, param: :venue_id
      scope 'venues/:venue_id', as: :venue do
        resources :locations, param: :location_id
      end

      resources :sessions, param: :session_id
      resources :participants, param: :participant_id
      resources :roles, param: :role_id
      resources :rsvps
      resources :participations

      resources :links, param: :link_id

      resources :videos, controller: "media"
      resources :audios, controller: "media"
      resources :photos, controller: "media"
    end
  end
end

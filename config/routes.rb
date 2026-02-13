Rails.application.routes.draw do
  root "pages#home"

  resources :rsvps, only: %i[new create]
  resources :gifts, only: %i[index show]

  namespace :admin do
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"

    resources :gifts
    resources :rsvps, only: :index
    resource :settings, only: %i[edit update], controller: "settings"
    root "rsvps#index"
  end
end

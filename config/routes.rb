Rails.application.routes.draw do

  resources :teachers

  resources :assignments

  resources :home

  resources :users

  resources :assistants

  resources :sessions

  get "/logout", to: "sessions#destroy"

  root to: "home#index"

end

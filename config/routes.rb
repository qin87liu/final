Rails.application.routes.draw do

  resources :teachers

  resources :assignments

  root to: "teachers#index"

end

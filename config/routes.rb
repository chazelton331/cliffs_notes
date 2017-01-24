Rails.application.routes.draw do

  resources :reminders
  resources :notes
  resources :features

  root to: "features#index"

end

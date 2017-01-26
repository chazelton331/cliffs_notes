Rails.application.routes.draw do

  resources :reminders
  resources :notes
  resources :features

  post "/notes/:id/bump" => "notes#bump", as: "bump_note"

  root to: "features#index"

end

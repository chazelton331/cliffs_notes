Rails.application.routes.draw do

  resources :notes

  post "/notes/:id/bump" => "notes#bump", as: "bump_note"

  root to: "notes#index"

end

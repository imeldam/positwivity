Positwivity::Application.routes.draw do
  root to: "tweets#new"

  resources :tweets, only: [:new, :create, :index]
end

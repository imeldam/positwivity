Positwivity::Application.routes.draw do
  root to: "tweets#index"

  resource :tweets, only: [:create, :index]
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show"

  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/rated_movies" => "rated_movies#index"
  get "/rated_movies/:id" => "rated_movies#show"
  post "/rated_movies" => "rated_movies#create"
  delete "/rated_movies/:id" => "rated_movies#destroy"
end

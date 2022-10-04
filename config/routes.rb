Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Define recipes default route
  get "recipes/index", to: "recipes#public"

  # Define routes for recipes
  resources :users do
    resources :recipes do
      #ressources :recipe_foods
    end
  end

  # Defines the root path route ("/")
  root "recipes#public"
  # root "articles#index"
end

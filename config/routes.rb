Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  # Define recipes default route
  get "recipes/index", to: "recipes#public"

  # Define routes for recipes
  resources :users do
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    end
  end

  # Defines the root path route ("/")
  root "recipes#public"
  # root "articles#index"

  # Define routes for foods
  resources :foods, only: [:index, :new, :create, :destroy]
end

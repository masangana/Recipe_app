Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  # Define recipes default route
  get "recipes/index", to: "recipes#public"

  # Define routes for recipes
  resources :users do
    resources :recipes do
      #resources :recipe_foods
      get "/foods/:id/remove" => "recipes#remove_food", as: :remove_food
      get "/foods/add" => "recipes#add_food_view", as: :add_food_view
      post "/foods/add" => "recipes#add_food", as: :add_food
    end
    resources :shoppings, only:[:index]
  end

  # Defines the root path route ("/")
  root "recipes#public"
  # root "articles#index"

end

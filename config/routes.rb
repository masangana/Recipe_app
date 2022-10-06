Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define recipes default route
  get "recipes", to: "recipes#public"

  # Define routes for recipes
  resources :users do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes do
      # #resources :recipe_foods
      # get "/foods/:id/remove" => "recipes#remove_food", as: :remove_food
      # get "/foods/add" => "recipes#add_food_view", as: :add_food_view
      # post "/foods/add" => "recipes#add_food", as: :add_food
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    end
    resources :shoppings, only:[:index]
  end

  # Defines the root path route ("/")
  root "recipes#public"
end

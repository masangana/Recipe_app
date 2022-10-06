Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define recipes default route
  get "recipes", to: "recipes#public"
  get 'shoppings/index'

  # Define routes for recipes
  resources :users do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
      resources :shoppings, only:[:index, :show]
    end
    
  end

  # Defines the root path route ("/")
  root "recipes#public"
end

require_relative '../models/shopping_item'
class ShoppingsController < ApplicationController
  def index
    @shoppings = []
    @recipes = Recipe.all
    @recipes.each do |recipe|
      recipe.recipe_foods.includes([:food]).each do |recipe_food|
        if recipe_food.quantity > recipe_food.food.quantity
          shopping_item = ShoppingItem.new(recipe_food.food, recipe_food.quantity - recipe_food.food.quantity)
          @shoppings << shopping_item
        end
      end
    end

    @total_price = @shoppings.inject(0) do |sum, shopping_item|
      sum + (shopping_item.food.price * shopping_item.required_quantity)
    end
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
    @food = Food.includes([:food])
    @total_price = 0
    @recipe_food.each do |fd|
      @total_price += fd.quantity * fd.food.price
    end
  end
end

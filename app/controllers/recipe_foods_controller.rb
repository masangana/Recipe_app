class RecipeFoodsController < ApplicationController
  def new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_food_params)
    if @recipe_food.save
      flash[:notice] = 'Food added successfully.'
      redirect_to user_recipe_url(@recipe.user, @recipe)
    else
      render 'new'
    end
  end

  def index
  end

  def show

  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])
    @recipe_food.destroy
    redirect_to user_recipe_url(@recipe.user, @recipe)
  end

  def recipe_food_params
    params.permit(:quantity, :food_id)
  end
end

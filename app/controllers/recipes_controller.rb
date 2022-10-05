class RecipesController < ApplicationController
  
  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:success] = "Recipe created!"
      redirect_to user_recipes_path
    else
      render 'new'
      flash[:error] = "Recipe not created!"
    end
  end

  def index
    @recipes = Recipe.includes([:user, :recipe_foods]).where(user_id: current_user.id).order('created_at DESC')
    @recipes.each do |recipe|
      recipe.recipe_foods.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
    end
  end

  def show
    @recipe = Recipe.includes([:user]).find(params[:id])
    @recipe_foods = @recipe.recipe_foods.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe deleted"
    redirect_to user_recipes_path
  end

  def public
    @public_recipes = Recipe.includes([:user, :recipe_foods]).where(public: true).order('created_at DESC')
    @public_recipes.each do |recipe|
      recipe.recipe_foods.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
    end
  end

  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :description, :public, :preparation_time, :cooking_time)
  end
  
  def add_food_view
    @receipt = Receipt.find(params[:receipt_id])
    render 'add_food'
  end
end

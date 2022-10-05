class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to foods_path
    else
      p @food.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @foods = Food.all
  end

  def destroy; end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end

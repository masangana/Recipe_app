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
      render :new
    end
  end

  def index
    @foods = Food.all
  end

  def destroy; end
end

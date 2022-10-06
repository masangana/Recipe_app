class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to user_foods_path
    else
      p @food.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @foods = Food.includes([:user]).where(user_id: current_user.id).order(:name)
  end

  def destroy
    Food.find(params[:id]).destroy
    flash[:success] = 'Food deleted'
    redirect_to user_foods_path
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end

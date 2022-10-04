class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    
  end

  def index
    @foods = Food.all
  end

  def destroy; end
end

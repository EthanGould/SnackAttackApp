class FoodlistsController < ApplicationController

  def index
    @foods = Food.all
  end

  def new
    food.new
  end

end

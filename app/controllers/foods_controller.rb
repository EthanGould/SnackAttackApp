class FoodsController < ApplicationController

  def show
    @food = Food.find(params[:id])
  end

  def create
    food = Food.find(params[:id])
    current_user.shopping_list << food
  end
end

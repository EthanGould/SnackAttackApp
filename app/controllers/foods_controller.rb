class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :create]

  def show
  end

  def create
    current_user.shopping_list << food
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end
end

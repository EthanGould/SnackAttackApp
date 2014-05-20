class FoodsController < ApplicationController

  def show
    @food = Food.find(params[:id])
  end
end

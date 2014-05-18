class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    # client = Nutritionix::Api_1_1.new(ENV['APPLICATION_ID'],ENV['NUTRITIONIX_API_KEY'])
    @food = Food.new(food_params)

    if @food.save
      redirect_to @food, success: "Your request has been recieved"
    else
      flash.now[:alert] = "Couldn't make food request"
      render :new
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :calories)
  end
end

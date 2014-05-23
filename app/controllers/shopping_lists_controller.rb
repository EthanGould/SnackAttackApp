class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :update, :destroy]

  def new
    @shopping_list = ShoppingList.new
  end

  def create
    @user = current_user
    @shopping_list = @user.shopping_lists.new(name: shopping_list_params[:name], user: current_user)
    if @shopping_list.save
      flash[:notice] = "Successfully created new shoppinglist"
      redirect_to root_path
    else
      flash.now[:alert] = @shopping_list.errors.full_messages
      render :new
    end
  end

  def update
    food = Food.find(params[:food_id])
    @shopping_list.foods << food
    redirect_to root_path
  end

  def destroy
    @shopping_list.destroy
    redirect_to root_path
  end

  private

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:id])
  end

  def shopping_list_params
    params.require(:shopping_list).permit(:name)
  end
end

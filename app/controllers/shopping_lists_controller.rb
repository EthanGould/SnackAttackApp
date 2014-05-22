class ShoppingListsController < ApplicationController


  def new
    @shopping_list = ShoppingList.new
  end

  def create
    @user = current_user
    @shopping_list = @user.shopping_lists.new(name: shopping_list_params[:name], user: current_user)
    if @shopping_list.save
      flash[:notice] = "Successfully created new shoppinglist"
      redirect_to accept_user_input_path
    else
      flash.now[:alert] = @shopping_list.errors.full_messages
      render :new
    end
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
  end

  def update
    shopping_list = ShoppingList.find(params[:id])
    food = Food.find(params[:food_id])
    shopping_list.foods << food
    redirect_to accept_user_input_path
  end

  def destroy
    shopping_list = ShoppingList.find(params[:id])
    shopping_list.destroy
    redirect_to root_path
  end

  private
  def shopping_list_params
    params.require(:shopping_list).permit(:name)
  end
end

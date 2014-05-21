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
    # need to specify shopping_list_params?
    shopping_list = ShoppingList.find(params[:id])
    #specify food_params? or just params?
    food = Food.find(params[:food_id])
    shopping_list.foods << food
    redirect_to accept_user_input_path
  end

  private
  def shopping_list_params
    params.require(:shopping_list).permit(:name)
  end
end

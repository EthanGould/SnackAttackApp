class ShoppingListsController < ApplicationController


  def new
    @shopping_list = ShoppingList.new
  end

  def create
    @shopping_list = ShoppingList.new
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

  end
end

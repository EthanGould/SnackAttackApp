class ShoppingListFoodRelationsController < ApplicationController

  def create
    food = Food.find(params[:food_id])
    current_user.shopping_list.shopping_list_food_relations.create(food_id: food.id)
    redirect_to root_path
  end
end

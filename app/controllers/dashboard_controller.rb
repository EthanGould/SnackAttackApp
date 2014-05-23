class DashboardController < ApplicationController

  def index
    #user startes with a shopping list if one isnt created yet
    if current_user.shopping_list.nil?
      @shopping_list = ShoppingList.create(user_id: current_user.id, name: 'my list')
    else
      @shopping_list = current_user.shopping_list
    end
    if params['user_input_form'].present? && params['user_input_form']['user_input'].present?
      #calls from the nutritionix model, returns a hash
      @api_response = Nutritionix.response(search_params['user_input'])
      @foods = save_response_to_db(@api_response['hits'])
    else
      @foods = []
    end
  end

  private

  def search_params
    params.require(:user_input_form).permit(:user_input)
  end

  def save_response_to_db(result)
    result.map { |food|
      # if food item isnt already in DB, an instance of it is saved.
      # also updates attributes of food from the API
      tmp_food = Food.find_or_initialize_by(api_response_id: food['fields']['item_id'])
      tmp_food.update_attributes(name: food['fields']['item_name'], calories: food['fields']['nf_calories'], protein: food['fields']['nf_protein'])
      tmp_food
    }
  end

end

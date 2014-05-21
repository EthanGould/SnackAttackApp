class DashboardController < ApplicationController

  def index
    @shopping_list = ShoppingList.first
    if params['user_input_form'].present? && params['user_input_form']['user_input'].present?
      #calls from the nutritionix model, returns a hash
      @api_response = Nutritionix.response(search_params['user_input'])
      @foods_array = save_response_to_db(@api_response['hits'])
    else
      @foods_array = []
    end
  end

  private

  def search_params
    params.require(:user_input_form).permit(:user_input)
  end

  def save_response_to_db(result_array)
    result_array.map { |food_hash|
      tmp_food = Food.find_or_initialize_by(api_response_id: food_hash['fields']['item_id'])
      tmp_food.update_attributes(name: food_hash['fields']['item_name'], calories: food_hash['fields']['nf_calories'], protein: food_hash['fields']['nf_protein'])
      tmp_food
    }
  end

end

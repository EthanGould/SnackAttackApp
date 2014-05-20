class DashboardController < ApplicationController

  def index
    if params['user_input_form']
      @results = call_api(search_params)
    else
      @results = []
    end
  end

  private

  def search_params
    params.require(:user_input_form).permit(:user_input)
  end

  def call_api(input)
    if input['user_input']
      api_key = 'd8372703aeb94b7035ce12d07f61ba84'
      api_id = 'ceadf6d2'
      query = input['user_input']
      api_url = "https://api.nutritionix.com/v1_1/search/#{query}?results=0:10&fields=item_name,brand_name,item_id,nf_calories,nf_carbohydrates,nf_protein,nf_carbs&appId=#{api_id}&appKey=#{api_key}"
      HTTParty.get(api_url)['hits']
    end
  end

end

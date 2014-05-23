class Nutritionix

  def self.response(query)
    api_key = ENV["NUTRITIONIX_API_KEY"]
    api_id = ENV["APPLICATION_ID"]
    api_url = "https://api.nutritionix.com/v1_1/search/#{query}?results=0:05&fields=item_name,brand_name,item_id,nf_calories,nf_carbohydrates,nf_protein,nf_carbs&appId=#{api_id}&appKey=#{api_key}"
    HTTParty.get(api_url)
  end
end

require 'rubygems'
require 'httparty'
require 'dotenv'

Dotenv.load

class Snack_Attack
  include HTTParty

  def self.response
    api_key = ENV['NUTRITIONIX_API_KEY']
    api_id = ENV['APPLICATION_ID']
    phrase = 'apple'
    api_url = 'https://api.nutritionix.com/v1_1/search/carrot?results=0:05&fields=item_name,brand_name,item_id,nf_calories,nf_carbohydrates,nf_protein&appId=ceadf6d2&appKey=d8372703aeb94b7035ce12d07f61ba84'
    HTTParty.get(api_url)
  end
end

Snack_Attack.response.each do |food|
  puts food["item_name"]
end

require 'rubygems'
require 'bundler/setup'
require 'httparty'
require 'pry'
require 'dotenv'

Dotenv.load

class Nutritionix

  def self.response(food)
    api_key = ENV["NUTRITIONIX_API_KEY"]
    api_id = ENV["APPLICATION_ID"]
    api_url = "https://api.nutritionix.com/v1_1/search/#{query}?results=0:01&fields=item_name,brand_name,item_id,nf_calories,nf_carbohydrates,nf_protein,nf_carbs&appId=#{api_id}&appKey=#{api_key}"
    HTTParty.get(api_url)
  end
end

puts Nutritionix(:user_input).response

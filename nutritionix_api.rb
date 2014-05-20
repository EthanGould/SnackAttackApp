require 'rubygems'
require 'typhoeus'
require 'pry'



request = Typhoeus::Request.new(
  "https://api.nutritionix.com/v1_1/search/carrot?results=0:01&fields=item_name,item_id,nf_calories,nf_protein&appId=ceadf6d2&appKey=d8372703aeb94b7035ce12d07f61ba84"
).run
puts JSON.parse(request.body)["hits"].first["fields"]["item_name"]

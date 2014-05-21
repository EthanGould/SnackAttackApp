class ShoppingList < ActiveRecord::Base
  belongs_to :user
  has_many :shopping_list_food_relations
  has_many :foods, through: :shopping_list_food_relations
end

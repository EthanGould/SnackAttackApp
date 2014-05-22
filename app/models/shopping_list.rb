class ShoppingList < ActiveRecord::Base
  belongs_to :user
  has_many :shopping_list_food_relations
  has_many :foods, through: :shopping_list_food_relations :dependent => :destroy
  # removes all food relations the shopping_list when the shopping_list is destroyed
end

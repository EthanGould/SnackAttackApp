class Food < ActiveRecord::Base

  has_many :shopping_list_food_relations
  has_many :shopping_lists, through: :shopping_list_food_relations
end

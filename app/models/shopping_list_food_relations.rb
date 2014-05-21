class ShoppingListFoodRelations < ActiveRecord::Base
  belongs_to :food
  belongs_to :shopping_list
end

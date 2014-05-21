class CreateShoppingListFoodRelations < ActiveRecord::Migration
  def change
    create_table :shopping_list_food_relations do |t|
      t.references :food, index: true
      t.references :shopping_list, index: true

      t.timestamps
    end
  end
end

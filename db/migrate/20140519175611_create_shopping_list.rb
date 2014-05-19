class CreateShoppingList < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.string :name
      t.string :food
      t.string :status
      t.boolean :is_current?
      t.references :user, index: true
    end
  end
end

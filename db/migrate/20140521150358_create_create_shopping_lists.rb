class CreateCreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :create_shopping_lists do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end

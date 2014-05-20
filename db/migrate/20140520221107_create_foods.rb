class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.integer :carbs
      t.integer :fat
      t.integer :protein

      t.timestamps
    end
  end
end

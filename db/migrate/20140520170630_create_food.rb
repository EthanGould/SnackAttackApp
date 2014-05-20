class CreateFood < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
    end
  end
end

class AddApiResponseIdToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :api_response_id, :string
  end
end

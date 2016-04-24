class AddMealIdToInsulins < ActiveRecord::Migration
  def change
		add_column :insulins, :meal_id, :integer
  end
end

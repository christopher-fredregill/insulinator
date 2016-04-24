class AddEatenAtToMeals < ActiveRecord::Migration
  def change
		add_column :meals, :eaten_at, :timestamp
  end
end

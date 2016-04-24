class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
			t.column :name, :string
			t.column :description, :string
      t.timestamps null: false
    end
  end
end

class CreateInsulins < ActiveRecord::Migration
  def change
    create_table :insulins do |t|
			t.column :name, :string
			t.column :description, :string
			t.column :amount, :decimal
      t.timestamps null: false
    end
  end
end

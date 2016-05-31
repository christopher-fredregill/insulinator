class CreateBloodSugars < ActiveRecord::Migration
  def change
    create_table :blood_sugars do |t|
      t.column :reading, :decimal
      t.column :units, :string 
      t.column :measured_at, :timestamp
      t.timestamps null: false
    end
  end
end

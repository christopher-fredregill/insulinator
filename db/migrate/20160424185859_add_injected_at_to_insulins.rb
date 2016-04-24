class AddInjectedAtToInsulins < ActiveRecord::Migration
  def change
  	add_column :insulins, :injected_at, :timestamp
	end
end

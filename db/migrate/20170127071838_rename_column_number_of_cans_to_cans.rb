class RenameColumnNumberOfCansToCans < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :number_of_cans, :cans
  end
end

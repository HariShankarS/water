class AddWaterBrandToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :water_brand, :string
  end
end

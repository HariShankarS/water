class AddUserIdAddressWaterBrandAndMobileToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :user_id, :integer
    add_column :orders, :address, :string
    add_column :orders, :water_brand, :string
    add_column :orders, :mobile, :string
  end
end

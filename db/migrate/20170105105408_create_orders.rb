class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :number_of_cans

      t.timestamps
    end
  end
end

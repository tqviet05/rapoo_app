class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.float :total_money
      t.integer :customer_id

      t.timestamps
    end
  end
end

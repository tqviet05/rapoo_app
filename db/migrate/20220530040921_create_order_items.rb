class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.float :price
      t.integer :quantity
      t.integer :oder_id

      t.timestamps
    end
  end
end

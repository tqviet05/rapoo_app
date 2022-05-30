class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :card_id

      t.timestamps
    end
  end
end

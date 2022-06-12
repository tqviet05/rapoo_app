class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.belongs_to :product, null: false
      t.belongs_to :cart, null: false

      t.timestamps
    end
  end
end

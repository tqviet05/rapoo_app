class AddDeletedAtToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :deleted_at, :datetime
    add_index :cart_items, :deleted_at
  end
end

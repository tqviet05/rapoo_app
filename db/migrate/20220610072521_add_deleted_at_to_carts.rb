class AddDeletedAtToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :deleted_at, :datetime
    add_index :carts, :deleted_at
  end
end

class AddDeletedAtToRecentlyProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :recently_products, :deleted_at, :datetime
    add_index :recently_products, :deleted_at
  end
end

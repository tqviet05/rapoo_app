class AddDeletedAtToDeliveries < ActiveRecord::Migration[6.1]
  def change
    add_column :deliveries, :deleted_at, :datetime
    add_index :deliveries, :deleted_at
  end
end

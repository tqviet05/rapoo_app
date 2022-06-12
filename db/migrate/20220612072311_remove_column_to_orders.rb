class RemoveColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :delivery_id
    add_column :orders, :name, :string
    add_column :orders, :phone, :string
    add_column :orders, :address,:string

  end
end

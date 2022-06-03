class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :cart
      t.float :pretax
      t.float :tax
      t.float :coupon
      t.float :order_total
      t.string :payment_token

      t.timestamps
    end
  end
end

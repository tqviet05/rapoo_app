class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :price
      t.float :tax
      t.float :coupon
      t.float :payment
      t.string :payment_token
      t.belongs_to :cart , null: false
      t.belongs_to :user , null: false
      t.belongs_to :delivery , null: false
      
      t.timestamps
    end
  end
end

class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.integer :phone
      t.string :address
      t.belongs_to :user

      t.timestamps
    end
  end
end

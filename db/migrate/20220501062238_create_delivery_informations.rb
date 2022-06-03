class CreateDeliveryInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_informations do |t|
      t.belongs_to :user
      t.string :name
      t.integer :phone
      t.string :address

      t.timestamps
    end
  end
end

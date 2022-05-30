class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.string :password_digest
      t.string :gender
      t.string :birthday

      t.timestamps
    end
  end
end

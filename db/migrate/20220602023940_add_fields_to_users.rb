class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :integer
    add_column :users, :address, :string
    add_column :users, :gender, :boolean
    add_column :users, :birthday, :date
  end
end

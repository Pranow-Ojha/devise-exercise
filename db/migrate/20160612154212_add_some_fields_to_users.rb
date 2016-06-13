class AddSomeFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :pin_code, :string
    add_column :users, :date_of_birth, :string
  end
end

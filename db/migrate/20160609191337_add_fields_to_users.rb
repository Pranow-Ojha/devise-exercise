class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :mobile_number, :string
    add_column :users, :org_name, :string
    add_column :users, :app_name, :string
  end
end

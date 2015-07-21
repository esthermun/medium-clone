class AddProfileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :username, :string
  	add_column :users, :description, :string
  end
end

class AddFullnameColumn < ActiveRecord::Migration
  def up
  	add_column :users, :full_name, :string
  end

  def down
  	remove_column :users, :full_name
  	error
  end
end

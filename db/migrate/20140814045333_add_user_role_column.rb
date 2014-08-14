class AddUserRoleColumn < ActiveRecord::Migration
  def up
  	add_column :users, :role, :string, :default => "agent"
  end

  def down
  	remove_column :users, :role
  end
end

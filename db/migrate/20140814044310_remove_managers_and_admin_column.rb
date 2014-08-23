class RemoveManagersAndAdminColumn < ActiveRecord::Migration
  def up
  	remove_column :users, :admin
  	remove_column :users, :manager
  end

  def down
  	remove_column :users, :admin, :default => false
  	remove_column :users, :manager, :default => false
  	creating error here
  end
end

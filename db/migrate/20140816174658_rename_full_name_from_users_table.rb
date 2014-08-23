class RenameFullNameFromUsersTable < ActiveRecord::Migration
  def up
  	rename_column :users, :full_name, :paynum
  end

  def down
  	rename_column :users, :paynum, :full_name
  end
end

class AddOfficeToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :office_number, :string
  	
  end

  def down
  	remove_column :users, :office_number, :string
  end
end

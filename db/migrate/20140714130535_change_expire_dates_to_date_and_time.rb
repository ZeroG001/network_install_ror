class ChangeExpireDatesToDateAndTime < ActiveRecord::Migration
  def up
  	remove_column :forms, :complete_date
  	remove_column :forms, :expire_date
  	add_column :forms, :complete_date, :datetime
  	add_column :forms, :expire_date, :datetime
  end

  def down
  	remove_column :forms, :complete_date
  	remove_column :forms, :expire_date
  	add_column :forms, :complete_date, :date
  	add_column :forms, :expire_date, :date
  end
end

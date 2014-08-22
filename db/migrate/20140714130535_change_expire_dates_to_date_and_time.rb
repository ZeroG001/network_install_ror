class ChangeExpireDatesToDateAndTime < ActiveRecord::Migration
  def up
  	remove_column :net_forms, :complete_date
  	remove_column :net_forms, :expire_date
  	add_column :net_forms, :complete_date, :datetime
  	add_column :net_forms, :expire_date, :datetime
  end

  def down
  	remove_column :net_forms, :complete_date
  	remove_column :net_forms, :expire_date
  	add_column :net_forms, :complete_date, :date
  	add_column :net_forms, :expire_date, :date
  end
end

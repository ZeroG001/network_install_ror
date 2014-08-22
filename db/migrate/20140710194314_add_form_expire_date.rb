class AddFormExpireDate < ActiveRecord::Migration
  def change
  	add_column :net_forms, :expire_date, :date
  end
end

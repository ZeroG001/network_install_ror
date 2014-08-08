class AddFormExpireDate < ActiveRecord::Migration
  def change
  	add_column :forms, :expire_date, :date
  end
end

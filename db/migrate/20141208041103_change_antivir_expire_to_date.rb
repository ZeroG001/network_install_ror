class ChangeAntivirExpireToDate < ActiveRecord::Migration
  def change
  	change_column :forms, :antivir_expire_date, :date
  end
end

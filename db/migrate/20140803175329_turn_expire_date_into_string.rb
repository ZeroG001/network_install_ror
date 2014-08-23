class TurnExpireDateIntoString < ActiveRecord::Migration
  def change
  		remove_column :net_forms, :antivir_expire_date
  		add_column :net_forms, :antivir_expire_date, :string 
  end
end

class TurnExpireDateIntoString < ActiveRecord::Migration
  def change
  		remove_column :forms, :antivir_expire_date
  		add_column :forms, :antivir_expire_date, :string 
  end
end

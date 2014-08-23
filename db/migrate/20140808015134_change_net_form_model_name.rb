class ChangeNetFormModelName < ActiveRecord::Migration

  def up
  	rename_table :net_forms, :forms
  end


  def down
  	error!
  	rename_table :forms, :net_forms
  	error!
  end

end
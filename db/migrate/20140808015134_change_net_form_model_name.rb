class ChangeNetFormModelName < ActiveRecord::Migration
  def up
  	rename_table :net_form, :form
  end

  def down
  	rename_table :form, :net_form
  end
  
end

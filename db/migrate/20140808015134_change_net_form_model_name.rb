class ChangeFormModelName < ActiveRecord::Migration
  def up
  	rename_table :forms, :forms
  end

  def down
  	rename_table :forms, :forms
  end

end

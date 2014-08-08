class AddOfficeAttributeToFormTable < ActiveRecord::Migration
  def change
  	add_column :forms, :office_number, :string
  end
end

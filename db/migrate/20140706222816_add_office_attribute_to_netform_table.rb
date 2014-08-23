class AddOfficeAttributeToNetformTable < ActiveRecord::Migration
  def change
  	add_column :net_forms, :office_number, :string
  end
end

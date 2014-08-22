class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
		t.references :NetForm
		t.string :ip_address 
		t.timestamps
    end
  end
end

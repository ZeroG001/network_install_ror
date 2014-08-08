class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
		t.references :Form
		t.string :ip_address 
		t.timestamps
    end
  end
end

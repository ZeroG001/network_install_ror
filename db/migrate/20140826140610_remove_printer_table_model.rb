class RemovePrinterTableModel < ActiveRecord::Migration
  def change
  	drop_table :printers
  end
end

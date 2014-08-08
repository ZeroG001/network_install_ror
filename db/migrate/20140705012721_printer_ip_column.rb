class PrinterIpColumn < ActiveRecord::Migration
  def change
  	add_column :forms, :printer_ip, :string 
  	remove_column :printers, :Form_id
  end
end

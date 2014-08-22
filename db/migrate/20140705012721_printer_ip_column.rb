class PrinterIpColumn < ActiveRecord::Migration
  def change
  	add_column :net_forms, :printer_ip, :string 
  	remove_column :printers, :NetForm_id
  end
end

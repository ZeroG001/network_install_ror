class CreateNetForms < ActiveRecord::Migration
  def change
    create_table :net_forms do |t|
      t.string :first_name
      t.string :last_name
      t.string :service_cost
      t.string :equipment_type
      t.string :nic_connection
      t.string :os_type
      t.string :antivir_type
      t.string :paynum
      t.date :complete_date
      t.binary :completed
      t.string :email
      t.string :phone_number
      t.string :computer_name
      t.date :antivir_expire_date
      t.string :technician_name

      t.timestamps
    end
  end
end

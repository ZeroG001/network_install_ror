json.array!(@forms) do |net_form|
  json.extract! net_form, :id, :first_name, :last_name, :service_cost, :equipment_type, :nic_connection, :os_type, :antivir_type, :paynum, :complete_date, :completed, :email, :phone_number, :computer_name, :antivir_expire_date, :technician_name
  json.url net_form_url(net_form, format: :json)
end

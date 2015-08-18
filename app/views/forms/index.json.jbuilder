json.array!(@forms) do |form|
  json.extract! form, :id, :first_name, :last_name, :service_cost, :equipment_type, :nic_connection, :os_type, :antivir_type, :paynum, :complete_date, :completed, :email, :phone_number, :computer_name, :antivir_expire_date, :technician_name
  json.url form_url(form, format: :json)
end

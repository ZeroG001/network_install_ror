class NetForm < ActiveRecord::Base
	
  # Here i wanted to make it so the user can enter a word instead of a date.
  # I will add this later
  # before_save :format_dates

  # def format_dates
  # 	self.antivir_expire_date = Chronic.parse(antivir_expire_date)
  # end
 

	serialize :printer_ip, Array
end

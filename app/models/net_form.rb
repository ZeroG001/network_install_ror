class NetForm < ActiveRecord::Base


	before_save :change_date
	# Change date expire data and complete date for form that have expired.
	# If there is not expire date and complete date then add one.
	def change_date
		if (self.completed == "1" and self.complete_date.nil? and self.expire_date.nil?)
			self.complete_date = Chronic.parse("today at 12:00am")
			self.expire_date = Chronic.parse("tomorrow at 12:00am") #This needs to be changed to next year
		end 

		# If the form has expired and is complete then renew.
		if self.completed == "1" and Chronic.parse("today") > self.expire_date
		self.complete_date = Chronic.parse("today at 12:00am")
		self.expire_date = Chronic.parse("tomorrow at 12:00am")	#This needs to be changed to next year
		end
	
	end

	
	# validates :first_name, presence: :true
	# validates :last_name, presence: :true
	# validates :paynum, presence: :true
	# validates :service_cost, presence: :true
	# validates :nic_connection, presence: :true
	# validates :os_type, presence: :true
	# validates :phone_number, format: { with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\z/ , message: "use the correct format"}
	# validates :printer_ip, format: { with: /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/, message: "IP address not valid" }



  # Here i wanted to make it so the user can enter a word instead of a date.
  # I will add this later
  # before_save :format_dates

  # def format_dates
  # 	self.antivir_expire_date = Chronic.parse(antivir_expire_date)
  # end
 

	serialize :printer_ip, Array
end

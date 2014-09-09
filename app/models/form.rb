class Form < ActiveRecord::Base	

	belongs_to :user

	before_save :change_date
	# Change date expire data and complete date for form that have expired.
	# If there is not expire date and complete date then add one.
	def change_date

		self.antivir_expire_date = Chronic.parse(self.antivir_expire_date);

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

	# I ran into errors when formatting a date with nothing in it.
	# This should fix it.
	def format_date(date)
		if (!self.antivir_expire_date.nil?)
    	Chronic.parse(self.antivir_expire_date).strftime("%m/%d/%Y")    		
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
 

	serialize :printer_ip, Array
end

class Form < ActiveRecord::Base


	def office_array
		[["5 Dearbor","5"],["7 Livonia","7"],["13 Commerce","13"],["15 Milford","15"],["17 Southfield / Lathrup Village","17"],["21 Southgate","21"],["23 Plymouth/Canton","23"],["24 Brighton","24"],["27 Clinton Township","27"],["28 Royal Oak","28"],["31 Ann Arbor","31"],["32 Fraser","32"],["34 Troy","34"],["35 Clarkston/Waterford","35"],["39 Rochester","39"],["42 Grosse Pointe - JJ","42"],["43 Dexter ","43"],["45 West Bloomfield","45"],["51 Novi","51"],["56 Bloomfield Hills - Max Broock","56"],["57 Clarkston - Max Broock Realtors","57"],["58 Birmingham - Max Broock Realtors","58"],["59 Rochester - Max Broock Realtors","59"],["72 St. Clair Shores","72"],["73 Dearborn Height","73"],["74 Shelby Twp","74"],["78 Milan","78"],["79 Saline","79"]]
	end

	# def office_array alphabetical
	# 	[["Ann Arbor","31"],["Birmingham - Max Broock Realtors","58"],["Bloomfield Hills - Max Broock","56"],["Brighton","24"],["Clarkston - Max Broock Realtors","57"],["Clarkston/Waterford","35"],["Clinton Township","27"],["Commerce","13"],["Dearbor","5"],["Dearborn Heights","73"],["Dexter ","43"],["Fraser","32"],["Grosse Pointe - JJ","42"],["Livonia","7"],["Milan","78"],["Milford","15"],["Novi","51"],["Saline","79"],["Shelby Twp","74"],["Southfield / Lathrup Village","17"],["Southgate","21"],["St. Clair Shores","72"],["Plymouth/Canton","23"],["Rochester","39"],["Rochester - Max Broock Realtors","59"],["Royal Oak","28"],["Troy","34"],["West Bloomfield","45"]]
	# end
	

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



  # Here i wanted to make it so the user can enter a word instead of a date.
  # I will add this later
  # before_save :format_dates

  # def format_dates
  # 	self.antivir_expire_date = Chronic.parse(antivir_expire_date)
  # end
 

	serialize :printer_ip, Array
end

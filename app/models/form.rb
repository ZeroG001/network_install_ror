class Form < ActiveRecord::Base	

	# =============================
	# => Database Associations
	# =============================

	belongs_to :user

	# =============================
	# => Before Filters/Actions
	# =============================

	 before_save :change_date

	# Change date expire data and complete date for form that have expired.
	# If there is not expire date and complete date then add one.
	def change_date
		# Used as workaround for problem
		right_now = Chronic.parse("this second")
		next_year = Chronic.parse("a year from now")
		tomorrow = Chronic.parse("tomorrow at 12:00am")

		self.antivir_expire_date = Chronic.parse(self.antivir_expire_date);

		if (self.completed == "1" and self.complete_date.nil? and self.expire_date.nil?)
			self.complete_date = right_now
			self.expire_date = next_year # was "a year from now" yearExpiredate entered here
		end 

		# If the form has expired and is complete then renew.
		if self.completed == "1" and right_now > self.expire_date
		self.complete_date = right_now
		self.expire_date = next_year # was "a year from now" Expire date entered here
		end
	end

	# I ran into errors when formatting a date with nothing in it.
	# This should fix it.
	def format_date(date)
		if (!self.antivir_expire_date.nil?)
    	Chronic.parse(self.antivir_expire_date).strftime("%m/%d/%Y")    		
      	end
	end

	# =============================
	# => Validations
	# =============================

	validates :first_name, presence: :true
	validates :last_name, presence: :true
	validates :paynum, 
				presence: :true,
				length: {maximum: 6, minimum: 5},
				format: {with: /[0-9]+/, message: "must contain only numbers"}
	# validates :service_cost, presence: :true
	# validates :nic_connection, presence: :true
	validates :phone_number, allow_blank: :true, format: { with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\z/, message: "use the correct format"}
	validates :printer_ip, allow_blank: :true, format: { with: /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/, message: "not valid" }
 

	serialize :printer_ip, Array
end

module FormsHelper
	def office_array
	end

	def format_date(date)
		if date.nil?
			return 
		end

		if !date.empty?
			Chronic.parse(date).strftime("%m/%d/%Y")
		end
	end
end


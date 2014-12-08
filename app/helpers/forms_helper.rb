module FormsHelper

	def format_date(date)
		if date.nil?
			return 
		end

		if date
			Chronic.parse(date.to_s).strftime("%m/%d/%Y")
		end
	end
end


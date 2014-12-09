module FormsHelper

	def format_date(date)
		if date.nil?
			return
		end

		if !date.empty?
			converted_date = Chronic.parse(date)

			if converted_date.nil?
				return
			else
				converted_date.strftime("%m/%d/%Y")
			end
		end
	end
end

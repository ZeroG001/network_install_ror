module FormsHelper
	def office_array
		[["",""],["5 Dearborn","5"],["7 Livonia","7"],["13 Commerce","13"],["15 Milford","15"],["17 Southfield / Lathrup Village","17"],["21 Southgate","21"],["23 Plymouth/Canton","23"],["24 Brighton","24"],["27 Clinton Township","27"],["28 Royal Oak","28"],["31 Ann Arbor","31"],["32 Fraser","32"],["34 Troy","34"],["35 Clarkston/Waterford","35"],["39 Rochester","39"],["42 Grosse Pointe - JJ","42"],["43 Dexter ","43"],["45 West Bloomfield","45"],["51 Novi","51"],["56 Bloomfield Hills - Max Broock","56"],["57 Clarkston - Max Broock Realtors","57"],["58 Birmingham - Max Broock Realtors","58"],["59 Rochester - Max Broock Realtors","59"],["72 St. Clair Shores","72"],["73 Dearborn Height","73"],["74 Shelby Twp","74"],["78 Milan","78"],["79 Saline","79"],["Yipsilanti","94"]]
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


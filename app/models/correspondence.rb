class Correspondence < ActiveRecord::Base

	def self.types
		["General Enquiry",  "Consultation", "Quotation"]
	end
end

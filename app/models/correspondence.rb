class Correspondence < ActiveRecord::Base
	apply_simple_captcha

	validates 	:first_name, 
				:last_name, 
				:company, 
				:designation, 
				:contact_number, 
				:email, 
				:industry, 
				:location, 
				presence: true

	validates :contact_number, {presence: {message: "Not a valid phone number"},
								numericality: true,
								length: {minimum: 10, maximum: 15}}
	validates :email, email: true

	def self.types
		["General Enquiry",  "Consultation", "Quotation"]
	end
end

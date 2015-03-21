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

	validates_format_of :contact_number, {:with => /\A\d{3}-\d{3}-\d{4}\z/ , message: "Not a valid phone number"}
	validates :contact_number, numericality: true
	validates :email, email: true

	def self.types
		["General Enquiry",  "Consultation", "Quotation"]
	end
end

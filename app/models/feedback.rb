class Feedback < ActiveRecord::Base
	apply_simple_captcha

	validates :company_name, :industry, :work_description, :feedback_description, :rating, presence: true
	validates :rating, numericality: true
end

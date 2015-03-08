class Feedback < ActiveRecord::Base

	validates :company_name, :industry, :work_description, :feedback_description, :rating, presence: true
	validates :rating, numericality: true
end

class ReportsController < ApplicationController
	layout "staff_layout"

	def feedback
		@feedbacks = Feedback.all

		@data = [] 

		(1..10).each do |c|
			@data.push({rating: c.to_s, count: @feedbacks.where("rating = #{c}").count, color: "#82b064"} )
		end

	end
end

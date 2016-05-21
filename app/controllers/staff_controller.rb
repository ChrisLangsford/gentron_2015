class StaffController < ApplicationController
	before_action :authenticate_user!
	layout 'staff_layout'	  

	def index

	end
end

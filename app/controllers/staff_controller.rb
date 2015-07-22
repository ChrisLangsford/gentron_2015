class StaffController < ApplicationController
	before_action :authenticate_user!
	  layout 'dynamic'

	def index

	end
end

class WelcomeController < ApplicationController
	def index
	@specials = Product.where(onSpecial: true).limit(4)	
	end

	def company		
	end

	def managed_services		
	end
	
end

class NewsroomController < ApplicationController
	  layout 'dynamic'

	def index
		@articles = Article.all
	end
end

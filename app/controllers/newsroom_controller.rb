class NewsroomController < ApplicationController
	layout 'newsroom_layout'
	def index
		@articles = Article.all
	end
end

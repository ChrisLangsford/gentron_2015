class NewsroomController < ApplicationController
	def index
		@articles = Article.all
	end
end

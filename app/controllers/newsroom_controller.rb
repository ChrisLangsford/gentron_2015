class NewsroomController < ApplicationController
	def index
		@articles = Article.all
		graph = Koala::Facebook::API.new(ENV['FACEBOOK_TOKEN'])

		@articles = graph.get_connection('GentronGroup', 'posts')
	end
end

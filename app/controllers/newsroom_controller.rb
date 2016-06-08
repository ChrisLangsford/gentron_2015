class NewsroomController < ApplicationController
	def index
		oauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'])
		oauth_token = oauth.get_app_access_token
		graph = Koala::Facebook::API.new(oauth_token)

		#@articles = Article.all

		@articles = graph.get_connection('GentronGroup', 'posts')
	end

end

class NewsroomController < ApplicationController
	  layout 'dynamic'

	def index
		@articles = Article.all
		urls = %w[http://www.itweb.co.za/index.php?option=com_rd_rss&id=1]
		feeds = Feedjira::Feed.fetch_and_parse urls
		feed = feeds["http://www.itweb.co.za/index.php?option=com_rd_rss&id=1"]

		@entries = feed.entries.last(8)





	end	
end

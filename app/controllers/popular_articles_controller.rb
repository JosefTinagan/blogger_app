class PopularArticlesController < ApplicationController

	def index
		@popular_article = Article.order(view_count: :desc)
		
	end
end

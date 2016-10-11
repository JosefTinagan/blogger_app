class ArticlesController < ApplicationController
	include ArticlesHelper

	before_filter :require_login, except: [:index, :show]

	def index
		@articles = Article.all
		@popular_article = Article.order(view_count: :desc)
	end

	def show
		@article = Article.find(params[:id])
		
		@article.view_count = Article.view_increment(@article.view_count)
		@article.save



		@comment = Comment.new
		@comment.article_id = @article_id
	end

	def new
		@article = Article.new
	end

	def create
  		@article = Article.new(article_params)
  		@article.save

  		flash.notice = "Article '#{@article.title}' created!"

  		redirect_to article_path(@article)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' updated!"

		redirect_to article_path(@article)
	end

	def destroy
		@desarticle = Article.find(params[:id])
		@desarticle.delete

		flash.notice = "Article '#{@desarticle.title}' deleted!"

		redirect_to articles_path
	end


	
end

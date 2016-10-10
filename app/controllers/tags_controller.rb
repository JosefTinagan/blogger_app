class TagsController < ApplicationController
	before_filter :require_login, only: [:destroy]

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])

	end

	def destroy
		@test_tag = Tag.find(params[:id])
		@test_tag.delete

		flash.notice = "Tag '#{@test_tag.name}' deleted!"

		redirect_to tags_path
	end
end

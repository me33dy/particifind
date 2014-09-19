module Api
	class PostsController < ApplicationController 
		respond_to :json

		def index
			@posts = Post.all
			respond_with @posts

		end

		def show


		end

		def destroy
		end

		def edit

		end

		def update
		end

		def new
		end

		def create
		end



	end

end
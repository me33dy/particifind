module Api
	class PostsController < ApplicationController 
		

		def index
			@posts = Post.all
			render json: @posts, root: false

		end

		def curr_posts
			@posts = current_user.posts
			render json: @posts, root: false

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
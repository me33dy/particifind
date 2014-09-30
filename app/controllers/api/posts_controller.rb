module Api
	class PostsController < ApplicationController 
		
		def index
			@posts = current_user.posts
			render json: @posts, root: false

		end
		def all_posts
			@posts = Post.all
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
			@post = current_user.posts.new(post_params)
			respond_to do |format|
				if @post.save
        			format.json { render json: @post, status: :created }

				else
					format.json { render json: @post.errors, status: :unprocessable_entity }
				end
			end
		end

		private
		def post_params
			params.require(:post).permit(:title, :field, :begin_date, :end_date, :participants_wanted, :gender, :description, :compensation,:min_age, :max_age, :location, :head, :website, :study_id )
		end


	end

end
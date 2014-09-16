class PostsController < ApplicationController
	before_action :authenticate_user, :except => [:home]
	before_action :set_post, :only => [:edit, :show, :update, :destroy]
	def show
	end

	def home
		@posts = Post.all
	end
	def index
		@posts = current_user.posts.all
	end

	def new
		@post = current_user.posts.new
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to :root
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to posts_path
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
			params.require(:post).permit(:title,:field,:begin_date, :end_date,  :participants_wanted, :age, :gender, :description, :compensation, :time_needed)
	end

end

class UsersController < ApplicationController
	before_action :set_user, :only => [:show, :edit, :update]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params);

		if @user.save
	  		session[:remember_token] = @user.id.to_s
	  		@current_user = @user
	  		redirect_to root_path
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @user.update_attributes(user_params)
			redirect_to :root
		else
			render :edit
		end
	end

	private 
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :field)
	end
	

end

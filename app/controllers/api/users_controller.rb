module Api
	class UsersController < ApplicationController 
		respond_to :json

		def index
			@user = User.all
			respond_with @user

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
class SessionsController < ApplicationController

	def new
	end

  def create 
  	@user = User.find_by(email: params[:session][:email])
  	if @user && @user.authenticate(params[:session][:password]) 
  		session[:remember_token] = @user.id.to_s
  		@current_user = @user
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def destroy
    # reset_session
  	session.delete(:remember_token)
  	redirect_to root_path
  end
end

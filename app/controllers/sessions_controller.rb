class SessionsController < ApplicationController

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.confirm(user_params)
		if @user
			login(@user)
			redirect_to user_path(@user)
		else
			flash[:notice] = "Could not match email and password"
			redirect_to root_path
		end
	end

	def delete
		logout
	end

	private
		def user_params
			params.require(:user).permit(:email, :password)
		end

end

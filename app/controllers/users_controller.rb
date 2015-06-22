class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		login(@user)
		if @user
			redirect_to "/users/#{@user.id}"
		else
			redirect_to new_user_path
		end
	end

	def survey
		@user = User.find(params[:id])
		render :survey
	end

	def show
		@user = User.find(params[:id])
		render :show	
	end

		private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end

end

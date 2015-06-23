class WelcomeController < ApplicationController
	def index
		if current_user
			@user = current_user
		end
		render :index
	end
end

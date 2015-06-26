class WelcomeController < ApplicationController
	def index
		if current_user
			@user = current_user
		end
	end

	def about
		if current_user
			@user = current_user
		end

		render :about
	end

	def contact
		if current_user
			@user = current_user
		end

		render :contact

	end
end

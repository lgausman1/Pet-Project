class PetsController < ApplicationController

	def index
		if current_user
			@user = current_user
		end
		@preference = Preference.find_by({user_id: params[:id]})
		@pets = Pet.all
	end

	def create
		#check if the pet id given by the shelter exists in our db
		# if it does not, add the pet to our db

	end

	def show
		@pet = Pet.find(params[:id])
		render :show
	end

end

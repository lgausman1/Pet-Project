class UserPetsController < ApplicationController

	def create
		@user = current_user
		@pet = Pet.find(params[:id])
		@user.pets.push(@pet)
		redirect_to "/users/#{@user.id}/matches"
	end

	def delete
		@user = current_user
		@pet = Pet.find(params[:id])
		@user.pets.delete(@pet)
		redirect_to "/users/#{@user.id}"
	end

end

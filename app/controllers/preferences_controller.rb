class PreferencesController < ApplicationController

	def create
		@preference = Preference.create(survey_params)
		user_id = current_user.id
		redirect_to "/users/#{user_id}/matches"

	end

	def survey
		@user = User.find(current_user)
		@preference = Preference.new
		render :survey
	end

	def edit
		@user = User.find(current_user)
		render :edit
	end

	def update
		@preference.update(survey_params)
		redirect_to "/users/#{@current_user.id}/matches"
	end

	private
		def survey_params
			survey_params = params.require(:preference).permit(:cat_or_dog, :activity_level,
											 				:young_children, :size_of_home, :time_with_pet,
											  				:training_pet, :user_id)
		end


end

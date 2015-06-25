class PreferencesController < ApplicationController

	def create
		@preference = Preference.create(survey_params)
		user_id = current_user.id
		binding.pry
		redirect_to "/users/#{user_id}"
	end

	def survey
		@user = User.find(current_user)
		@preference = Preference.new
		render :survey
	end

	def edit
		@user = User.find(current_user)
		@preference = Preference.find_by({user_id: params[:id]})
		render :edit
	end

	def update
		@preference = Preference.find_by({user_id: current_user.id})
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

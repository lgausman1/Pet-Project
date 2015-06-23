class PreferencesController < ApplicationController

	def create
		@preference = Preference.create(survey_params)
	end

	def edit
	end

	def update
	end

	private

		def survey_params
			survey_params = params.require(:user).permit(:cat_or_dog, :size_of_home, :young_children,
																		 :activity_level, :time_with_pet, :training_pet, :user_id)
			 # give these params to user_preferences and probably push it to user
			 # user_preferences.create(survey_params)
		end
		

end

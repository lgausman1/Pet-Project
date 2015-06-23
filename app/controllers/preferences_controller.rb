class PreferencesController < ApplicationController

	def create
	end

	def edit
	end

	def update
	end

	private

		def survey_params
			survey_params = params.require(:user).permit(:pet_type, :house_size, :has_young_children, :activity_level, :time_with_animal, :can_train)
			 # give these params to user_preferences and probably push it to user
			 # user_preferences.create(survey_params)
		end

		def cat_or_dog

		end

end

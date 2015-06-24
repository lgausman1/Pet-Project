class UsersController < ApplicationController
	require 'pg'

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		login(@user)
		if @user
			redirect_to "/preferences/users/#{@user.id}"
		else
			redirect_to register_path
		end
	end

	def survey
		@user = User.find(params[:id])
		@preference = Preference.new
		render :survey
	end

	def show
		# should the sql query and the other methods be here or in the preferences controller?
			# methods: cat_or_dog, activity_level, young_children, size_of_home, time_with_pet, training_pet
		# sql query using this info on Pets 
		# SELECT * FROM pets
		# 	WHERE species = cat_or_dog
		# 	WHERE activity_level = activity_level
		# 	# WHERE age > "5M"
		# 	# WHERE weight <= size_of_home
		# 	# WHERE  = time_with_pet
		# 	# WHERE  = training_pet 
		@pets = Pet.all.where(species: cat_or_dog).where(activity_level: activity_level).where("age > ?", 5)
		@user = User.find(params[:id])
		render :show	

	end

	def edit
		@user = User.find(params[:id])
		render :edit
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :photo_url, :survey_info)
		end

		def cat_or_dog
		# should determine which set of data to sort through
		# TODO: need to add preferences to the user
		@user_preferences = Preference.find_by({user_id: current_user.id})
		return @user_preferences.cat_or_dog
		end

		def activity_level
			if cat_or_dog == "dog"
				return @user_preferences.activity_level
			elsif cat_or_dog == "cat"
				return nil
			end
		end

		def young_children
			if @user_preferences.young_children == "yes"
				return 
				# do not return pets younger than 5 months
			end
		end

		def size_of_home
			if @user_preferences.size_of_home == "small apartment"
				# return small to medium dogs
				return 55
			elsif @user_preferences.size_of_home == "big apartment"
				# return all but the largest dogs
				return 100
			elsif @user_preferences.size_of_home == "house"
				# return all dogs
				return 200
			end		
		end

		def time_with_pet
			if @user_preferences.time_with_pet == "not a lot"
				# return adult dogs or maybe cats
			elsif @user_preferences.time_with_pet == "decent amount"
				# return all dogs that are not puppies and cats
			elsif @user_preferences.time_with_pet == "lots of time"
				# return all pets
			end	
		end

		def training_pet
			if @user_preferences.training_pet == "yes"
				# return all pets
			else
				# return older (one year of more)pets and cats
			end
		end



		
end


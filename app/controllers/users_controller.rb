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
		# this is maybe where the survey info will be applied
		# to what pets will be shown
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
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end

		def cat_or_dog
		# should determine which set of data to sort through
		# TODO: need to add preferences to the user
		preferred_pet = Pet.find_by({species: @user.preferences.cat_or_dog})
		end

		def activity_level
			if cat_or_dog == "dog"
				if @user.preferences.activity_level == "high"
					# return dogs with medium or high activity level
					# and young dogs
				elsif @user.preferences.activity_level == "medium"
					# return dogs with medium activity level
					# and young to 5 years old dogs
				elsif @user.preferences.activity_level == "low"
					# return dogs with low activity level
					# and possibly older dogs
				end
			elsif cat_or_dog == "cat"
				# return all cats
			end
		end

		def young_children
			if @user.preferences.young_children == "yes"
				# do not return pets younger than 5 months
			end
		end

		def size_of_home
			if @user.preferences.size_of_home == "small apartment"
				# return small to medium dogs
			elsif @user.preferences.size_of_home == "big apartment"
				# return all but the largest dogs
			elsif @user.preferences.size_of_home == "house"
				# return all dogs
			end		
		end

		def time_with_pet
			if @user.preferences.time_with_pet == "not a lot"
				# return adult dogs or maybe cats
			elsif @user.preferences.time_with_pet == "decent amount"
				# return all dogs that are not puppies and cats
			elsif @user.preferences.time_with_pet == "lots of time"
				# return all pets
			end	
		end

		def training_pet
			if @user.preferences.training_pet == "yes"
				# return all pets
			else
				# return older pets and cats
			end
		end

end















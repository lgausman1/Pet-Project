class UsersController < ApplicationController
	require 'pg'

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

		# 	conn = PG.connect(dbname: "shopper_app")

		# 	conn.exec("CREATE TABLE shopper (
		# 	              id serial primary key,
		# 	              first_name varchar(255),
		# 	              last_name varchar(255),
		# 	              email text,
		# 	              address text)")
		@pets = Pet.find_by({species: cat_or_dog}).where(activity_level: activity_level)
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
				return @user.preferences.activity_level
				# if @user.preferences.activity_level == "high"
				# 	# return dogs with medium or high activity level
				# 	# and young dogs
				# 	return "hig"
				# elsif @user.preferences.activity_level == "medium"
				# 	# return dogs with medium activity level
				# 	# and young to 5 years old dogs
				# elsif @user.preferences.activity_level == "low"
				# 	# return dogs with low activity level
				# 	# and possibly older dogs
				# end
			elsif cat_or_dog == "cat"
				# return all cats
				return nil
			end
		end

		def young_children
			if @user.preferences.young_children == "yes"
				return 
				# do not return pets younger than 5 months
			end
		end

		def size_of_home
			if @user.preferences.size_of_home == "small apartment"
				# return small to medium dogs
				return 55
			elsif @user.preferences.size_of_home == "big apartment"
				# return all but the largest dogs
				return 100
			elsif @user.preferences.size_of_home == "house"
				# return all dogs
				return 200
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
				# return older (one year of more)pets and cats
			end
		end

end















class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		login(@user)
		if @user != nil
			redirect_to "/preferences/users/#{@user.id}"
		else
			flash[:notice] = @user.errors.full_messages.to_sentence
			redirect_to root_path
		end
	end

	def survey
		@user = User.find(params[:id])
		render :survey
	end

	def show
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

	def matches
		@user = current_user
		if @user.id != params[:id].to_i
			redirect_to "/users/#{@user.id}"
			return
		end

		@pets = Pet.all
			.where(species: cat_or_dog)
			.where(activity_level: activity_level)
			.where("age > ?", age_cutoff)
			.where("weight < ?", size_of_home)
			.where("age > ?", time_with_pet)
		@user = User.find(params[:id])	

		render :matches
	end

	def refresh_pets
		Pet.delete_all
		@user = current_user
		response_cats = HTTParty.get 'http://www.kimonolabs.com/api/bo1g4i5q?apikey=0AQUI7VQU8WOOshS9WxdFpe02TiuGorc'
		response_cats["results"]["collection1"].each do |cat|

			Pet.create({name: cat["name"], species: "cat", gender: cat["gender"], age: convert_age_to_months(cat["age"]),
					 weight: convert_weight_to_ounces(cat["weight"]), description: cat["description"],
					 thumbnail: cat["picture"]["src"], shelter_id: cat["id"], personality: cat_personality(cat["personality"])})

			end

		response_dogs = HTTParty.get 'http://www.kimonolabs.com/api/ch62ea86?apikey=0AQUI7VQU8WOOshS9WxdFpe02TiuGorc'

		response_dogs["results"]["collection1"].each do |dog|
			Pet.create({name: dog["name"], species: "dog", gender: dog["gender"], age: convert_age_to_months(dog["age"]),
					 weight: convert_weight_to_ounces(dog["weight"]), description: dog["description"], thumbnail: dog["picture"]["src"],
					 personality: dog_personality(dog["personality"]), activity_level: dog["activity_level"], shelter_id: dog["id"]})
			end


		redirect_to matches_path(@user.id)
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

		def age_cutoff
			# do not return pets younger than 5 months
			if young_children || training_pet
				5
			else
				0
			end
		end

		def young_children
			@user_preferences.young_children == "yes"
		end

		def size_of_home
			if @user_preferences.size_of_home == "1" || @user_preferences.size_of_home == "small apartment"
				# return small to medium dogs
				return 880
			elsif @user_preferences.size_of_home == "2" || @user_preferences.size_of_home == "big apartment"
				# return all but the largest dogs
				return 1600
			elsif @user_preferences.size_of_home == "3" || @user_preferences.size_of_home == "house"
				# return all dogs
				return 3200
			end
		end

		def time_with_pet
			if cat_or_dog == "dog"
				if @user_preferences.time_with_pet == "not a lot"
					# return adult dogs or maybe cats
					return 24
				elsif @user_preferences.time_with_pet == "decent amount"
					# return all dogs that are not puppies and cats
					return 12
				elsif @user_preferences.time_with_pet == "lots of time"
					# return all pets
					return 0
				end
			end
			return 0
		end

		def training_pet
			@user_preferences.training_pet == "no"
		end



		def convert_age_to_months(age_string)
			parse_string_to_number(age_string, 12)
		end

		def convert_weight_to_ounces(weight_string)
			parse_string_to_number(weight_string, 16)
		end

		# string is something like "3Y 2M" for age or "5lbs. 6oz." for weight
		# multiplier is 12 for age and 16 for weight.
		def parse_string_to_number(string, multiplier)
			return nil if string.nil?
			num_string = string.gsub(/[^0-9]/, ' ')
			# num_array is an array of the component numbers making up the string
			num_array = num_string.split(' ').map { |s| s.to_i }
			if num_array.length == 1
				return num_array[0]
			else
				return num_array[0] * multiplier + num_array[1]
			end
		end

		def user_personality
			if cat_or_dog == "cat"
				if @user_preferences.user_personality == "I'm very active"
					return "Poet"
				elsif @user_preferences.user_personality == "I prefer quiet places"
					return "Lion hearted"
				end
			else
				return "busy bee"
			end
		end

		def dog_personality(data)
			if data == nil
				return "zen master"
			end
			return data
		end

		def cat_personality(data)
			if data == nil
				return "Cat Next Door"
			end
			return data
		end
end

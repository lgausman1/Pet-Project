class Pet < ActiveRecord::Base
	has_many :user_pets
	has_many :users, :through => :user_pets

	def display_age
		# should return something like "5 years and 3 months"
	end 

	def display_weight
		# should return something like "5lbs 3oz"
	end 
end

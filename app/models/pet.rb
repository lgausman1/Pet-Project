class Pet < ActiveRecord::Base
	has_many :user_pets, :dependent => :delete_all
	has_many :users, :through => :user_pets, :dependent => :delete_all

	def display_age
		# should return something like "5 years and 3 months"
	end 

	def display_weight
		# should return something like "5lbs 3oz"
	end 
end
# update or delete on table "pets" violates foreign key constraint "fk_rails_dedd5edecd" on table "user_pets
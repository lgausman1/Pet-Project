# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Pet.delete_all

def convert_age_to_months(age_string)
	parse_string_to_number(age_string, "age")
end 

def convert_weight_to_ounces(weight_string)
	parse_string_to_number(weight_string, "weight")
end 

# string is something like "3Y 2M" for age or "5lbs. 6oz." for weight
# multiplier is 12 for age and 16 for weight.
def parse_string_to_number(string, age_or_weight)
	multiplier = age_or_weight == 'age' ? 12 : 16
	return nil if string.nil?
	num_string = string.gsub(/[^0-9]/, ' ')
	# num_array is an array of the component numbers making up the string
	num_array = num_string.split(' ').map { |s| s.to_i }	
	if num_array.length == 1
		# if only one digit is provided, it's a number of months for age, or a number of pounds for 
		# weight, so we only multiply for weight
		if age_or_weight == 'age'
			return num_array[0]
		else 
			return num_array[0] * multiplier
		end
	else 
		return num_array[0] * multiplier + num_array[1]
	end 
end 

require 'HTTParty'

response = HTTParty.get 'http://www.kimonolabs.com/api/bo1g4i5q?apikey=0AQUI7VQU8WOOshS9WxdFpe02TiuGorc'
response["results"]["collection1"].each do |cat|

	Pet.create({name: cat["name"], species: "cat", gender: cat["gender"], age: convert_age_to_months(cat["age"]),
				 weight: convert_weight_to_ounces(cat["weight"]), description: cat["description"],
				 thumbnail: cat["picture"]["src"], shelter_id: cat["id"]})

end

response = HTTParty.get 'http://www.kimonolabs.com/api/ch62ea86?apikey=0AQUI7VQU8WOOshS9WxdFpe02TiuGorc'

response["results"]["collection1"].each do |dog|
	Pet.create({name: dog["name"], species: "dog", gender: dog["gender"], age: convert_age_to_months(dog["age"]),
				 weight: convert_weight_to_ounces(dog["weight"]), description: dog["description"], thumbnail: dog["picture"]["src"],
				 personality: dog["personality"], activity_level: dog["activity_level"], shelter_id: dog["id"]})
end












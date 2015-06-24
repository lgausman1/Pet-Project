# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Pet.delete_all
pet1 = Pet.create(name: 'mr.snickers', species: 'cat', breed: 'tabby', age: 3, gender: 'Female')
pet2 = Pet.create(name: 'socksy wocksy', species: 'cat', breed: 'calico', age: 2, gender: 'Male')
pet3 = Pet.create(name: 'whiskers', species: 'cat', breed: 'maincoon', age: 5, gender: 'Female')
pet3 = Pet.create(name: 'KittyWitty', species: 'cat', breed: 'siamese', age: 4, gender: 'Male', activity_level: "High")


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
	num_string = string.gsub(/[^0-9]/, '')
	# num_array is an array of the component numbers making up the string
	num_array = num_string.split(' ').map { |s| s.to_i }	
	if num_array.length == 1
		return num_array[0]
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












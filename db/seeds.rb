# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Pet.delete_all
pet1 = Pet.create(name: 'mr.snickers', species: 'cat', breed: 'tabby', age: '3 months', gender: 'female')
pet2 = Pet.create(name: 'socksy wocksy', species: 'cat', breed: 'calico', age: '2 years', gender: 'male')
pet3 = Pet.create(name: 'whiskers', species: 'cat', breed: 'maincoon', age: '5 months', gender: 'female')

require 'HTTParty'

response = HTTParty.get 'https://www.kimonolabs.com/api/bo1g4i5q?apikey=0AQUI7VQU8WOOshS9WxdFpe02TiuGorc'
response["results"]["collection1"].each do |cat|
	Pet.create({name: cat["name"], species: "cat", gender: cat["gender"], age: cat["age"],
				 weight: cat["weight"], description: cat["description"], thumbnail: cat["picture"]["src"]})
end

response = HTTParty.get 'https://www.kimonolabs.com/api/ch62ea86?apikey=0AQUI7VQU8WOOshS9WxdFpe02TiuGorc'

response["results"]["collection1"].each do |dog|
	Pet.create({name: dog["name"], species: "dog", gender: dog["gender"], age: dog["age"],
				 weight: dog["weight"], description: dog["description"], thumbnail: dog["picture"]["src"],
				 personality: dog["personality"], activity_level: dog["activity_level"]})
end
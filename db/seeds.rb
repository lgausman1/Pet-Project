# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pet1 = Pet.create(name: 'mr.snickers', species: 'cat', breed: 'tabby', age: '3 months', gender: 'female')
pet2 = Pet.create(name: 'socksy wocksy', species: 'cat', breed: 'calico', age: '2 years', gender: 'male')
pet3 = Pet.create(name: 'whiskers', species: 'cat', breed: 'maincoon', age: '5 months', gender: 'female')
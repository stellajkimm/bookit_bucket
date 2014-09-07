require 'faker'

Category.create(name: "Restaurants")
Category.create(name: "Dates")
Category.create(name: "Books")
Category.create(name: "Miscellaneous")
Category.create(name: "Movies")

10.times do
	location = Faker::Address.city + ", " + Faker::Address.state_abbr
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, password: "password", location: location)


end
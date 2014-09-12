require 'faker'

privacy = ["public", "private"] # also group
status = ["archive", "done", "todo"]

10.times do
	Hashtag.create(tag: Faker::Commerce.department)
end

10.times do
	location = Faker::Address.city + ", " + Faker::Address.state_abbr
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, password: "password", location: location)

	2.times do
		bucket = user.created_buckets.create(name: Faker::Commerce.product_name, privacy: privacy.sample)		
		bucket.bucket_hashtags.create(hashtag_id: (1..10).to_a.sample)
		
		#need a better algorithm to seed mostly non-group buckets
		[0,0,0,0,0,0,0,0,0,0,1,2,3,4,5].sample.times do
			bucket.bucket_ownerships.create(user_id: (1..11).to_a.sample)
		end

		bucket.privacy = "group" if bucket.bucket_ownerships.length > 1
		bucket.save

		10.times do
			bucket.items.create(name: Faker::Company.bs, status: status.sample)
		end
	end
end


## seed for my own purposes
user = User.create(first_name: "Stella", last_name: "Kim", email: "stella@stella.com", phone_number: "555.555.5555", password: "password", location: "Stamford, CT")

10.times do
	bucket = user.created_buckets.create(name: Faker::Commerce.product_name, privacy: privacy.sample)		
	bucket.bucket_hashtags.create(hashtag_id: (1..10).to_a.sample)

	#need a better algorithm to seed mostly non-group buckets
	[0,0,0,0,0,0,0,0,0,0,1,2,3,4,5].sample.times do
		bucket.bucket_ownerships.create(user_id: (1..10).to_a.sample)
	end

	bucket.privacy = "group" if bucket.bucket_ownerships.length > 1
	bucket.save

	10.times do
		bucket.items.create(name: Faker::Company.bs, status: status.sample)
	end
end


## have not yet made attendances
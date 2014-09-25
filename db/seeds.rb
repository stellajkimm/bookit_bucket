require 'faker'

privacy = ["public", "private"] # also group
status = ["done", "todo"]

10.times do
	Hashtag.create(tag: Faker::Commerce.product_name)
end

10.times do
	location = Faker::Address.city + ", " + Faker::Address.state_abbr
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, password: "password", location: location, picture: "http://th00.deviantart.net/fs70/PRE/f/2013/140/9/8/cute_little_narwhal_by_fallenstar20-d65z1e4.png")

	2.times do
		bucket = user.created_buckets.create(name: Faker::Commerce.product_name, privacy: privacy.sample)		
		(0..4).to_a.sample.times do 
			bucket.bucket_hashtags.create(hashtag_id: (1..10).to_a.sample)
		end

		#need a better algorithm to seed mostly non-group buckets
		[0,0,0,0,0,0,0,0,0,0,1,2,3,4,5].sample.times do
			bucket.bucket_ownerships.create(user_id: (1..11).to_a.sample)
		end

		bucket.privacy = "group" if bucket.bucket_ownerships.length > 1
		bucket.save

		10.times do
			location = Faker::Address.city + ", " + Faker::Address.state_abbr
			item = bucket.items.create(name: Faker::Company.bs, location: location, status: status.sample)
			if bucket.privacy == "group"
				(0..bucket.bucket_ownerships.length).to_a.sample.times do
					item.attendances.create(user_id: bucket.bucket_ownerships.sample.user_id)
				end
			end
		end
	end
end


## seed for my own purposes
user = User.create(first_name: "Stella", last_name: "Kim", email: "stella@stella.com", phone_number: "555.555.5555", password: "password", location: "Stamford, CT", picture: "http://nyan-cat.com/images/nyan-cat.gif")

10.times do
	bucket = user.created_buckets.create(name: Faker::Commerce.product_name, privacy: privacy.sample)		
	(0..4).to_a.sample.times do 
		bucket.bucket_hashtags.create(hashtag_id: (1..10).to_a.sample)
	end
	
	#need a better algorithm to seed mostly non-group buckets
	[0,0,0,0,0,0,0,0,0,0,1,2,3,4,5].sample.times do
		bucket.bucket_ownerships.create(user_id: (1..10).to_a.sample)
	end

	bucket.privacy = "group" if bucket.bucket_ownerships.length > 1
	bucket.save

	10.times do
		location = Faker::Address.city + ", " + Faker::Address.state_abbr
		item = bucket.items.create(name: Faker::Company.bs, location: location, status: status.sample)
		if bucket.privacy == "group"
			(0..bucket.bucket_ownerships.length).to_a.sample.times do
				item.attendances.create(user_id: bucket.bucket_ownerships.sample.user_id)
			end
		end
	end
end
require 'faker'


privacy = ["public", "private"]
status = ["archive", "done", "to do"]

10.times do
	Hashtag.create(tag: Faker::Commerce.department)
end

10.times do
	location = Faker::Address.city + ", " + Faker::Address.state_abbr
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, password: "password", location: location)

	2.times do
		bucket = user.created_buckets.create(name: Faker::Commerce.product_name, privacy: privacy.sample)		
		bucket.bucket_hashtags.create(hashtag_id: (1..10).to_a.sample)
		10.times do
			bucket.items.create(name: Faker::Company.bs, status: status.sample)
		end
	end
end

## have not yet made more bucketownerships and attendances
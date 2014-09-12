module BucketHelper
	def username(user_id)
		user = User.find(user_id)
		user.first_name + " " + user.last_name
	end

	def user(user_id)
		user = User.find(user_id)
	end

	def short_list(bucket_id)
		bucket = Bucket.find(bucket_id)
		items = bucket.items.limit(5)
	end
end

module BucketHelper
	def username(user_id)
		user = User.find(user_id)
		user.first_name + " " + user.last_name
	end

	def user(user_id)
		user = User.find(user_id)
	end
end

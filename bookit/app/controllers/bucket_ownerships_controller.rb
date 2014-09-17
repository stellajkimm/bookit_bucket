class BucketOwnershipsController < ApplicationController
	def index
		@bucket = Bucket.find(params[:bucket_id])
		@bucket_ownership = @bucket.bucket_ownerships.new
		@users_array = User.all.map { |user| ["#{user.first_name} #{user.last_name}", user.id] }
	end
end

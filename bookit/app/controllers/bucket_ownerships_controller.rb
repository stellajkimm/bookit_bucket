class BucketOwnershipsController < ApplicationController
	def index
		@bucket = Bucket.find(params[:bucket_id])
		@bucket_ownership = @bucket.bucket_ownerships.new

		# still haven't implemented friends yet so this will change
		@users_array = User.all - @bucket.owners
	end
end

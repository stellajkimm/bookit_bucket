class BucketOwnershipsController < ApplicationController
	def index
		@bucket = Bucket.find(params[:bucket_id])
	end
end

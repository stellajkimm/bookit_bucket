class BucketOwnershipsController < ApplicationController
	def index
		@bucket = Bucket.find(params[:bucket_id])
		@bucket_ownership = @bucket.bucket_ownerships.new

		# still haven't implemented friends yet so this will change
		@users_array = User.all - @bucket.owners
	end

	def create
		p "here"
		@bucket = Bucket.find(params[:bucket_id])
		@bucket.bucket_ownerships.create(bucket_ownership_params)
		p "created...?"
		redirect_to bucket_bucket_ownerships_path(@bucket)
	end

	def destroy
		@bucket = Bucket.find(params[:bucket_id])
		@bucket_ownership = @bucket.bucket_ownerships.find_by(user_id: params[:bucket_ownership][:user_id])
		@bucket_ownership.destroy
		redirect_to bucket_bucket_ownerships_path(@bucket)
	end

	def bucket_ownership_params
    params.require(:bucket_ownership).permit(:user_id)
  end
end

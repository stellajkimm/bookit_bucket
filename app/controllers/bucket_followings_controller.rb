class BucketFollowingsController < ApplicationController
	def create
		@bucket = Bucket.find(params[:bucket_id])
		@bucket.bucket_followings.create(user_id: current_user.id)
		redirect_to bucket_show_following_path
	end

	def destroy
		@bucket = Bucket.find(params[:bucket_id])
		@bucket_following = @bucket.bucket_followings.find_by(user_id: current_user.id)
		@bucket_following.destroy
		redirect_to bucket_show_following_path
	end
end

class BucketsController < ApplicationController
	def index
		@buckets = Bucket.where(archive: false)
	end

	def home
		@buckets = current_user.owned_buckets.where(archive: false)
	end

	def show
		@bucket = Bucket.find(params[:id])
		@items = @bucket.items
		@item = Item.new
	end

	def new
		@bucket = Bucket.new
	end

	def create
		user = current_user
		bucket = user.created_buckets.create(bucket_params)
		redirect_to bucket_path(bucket)
	end

	def destroy
		bucket = Bucket.find(params[:id])
		bucket.destroy
		redirect_to buckets_home_path
	end

	def edit
		@bucket = Bucket.find(params[:id])
	end

	def update
		bucket = Bucket.find(params[:id])
		bucket.update(bucket_params)
		redirect_to bucket_path(bucket)
	end

	def archive
		bucket = Bucket.find(params[:id])
		bucket.update(archive: true)
		redirect_to buckets_home_path
	end


	private
  
  def bucket_params
    params.require(:bucket).permit(:name, :privacy, :user_id, :archive)
  end

end


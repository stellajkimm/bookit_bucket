class BucketsController < ApplicationController
	def index
		@buckets = Bucket.where(archive: false)
	end

	def home
		@buckets = current_user.owned_buckets.where(archive: false)
	end

	def show
		@bucket = Bucket.find(params[:id])
		@items = @bucket.items.order(status: :desc)
		@item = Item.new
	end

	def new
		@bucket = Bucket.new
	end

	def create
		@bucket = current_user.created_buckets.create(bucket_params)
		redirect_to bucket_update_hashtags_path(@bucket, :hashtags => params[:bucket][:hashtags][:tag])
	end

	def destroy
		bucket = Bucket.find(params[:id])
		bucket.destroy
		redirect_to buckets_home_path
	end

	def edit
		@bucket = Bucket.find(params[:id])
		@hashtags = ""
		@bucket.hashtags.each {|x| @hashtags << "##{x.tag} " }
	end

	def update
		@bucket = Bucket.find(params[:id])
		@bucket.update(bucket_params)
		redirect_to bucket_update_hashtags_path(@bucket, :hashtags => params[:bucket][:hashtags][:tag])
	end

	def archive
		bucket = Bucket.find(params[:id])
		bucket.archive == false ? bucket.update(archive: true) : bucket.update(archive: false)
		redirect_to buckets_home_path
	end

	def show_archive
		@buckets = current_user.owned_buckets.where(archive: true)
	end

	private
  
  def bucket_params
    params.require(:bucket).permit(:name, :privacy, :user_id, :archive)
  end

end


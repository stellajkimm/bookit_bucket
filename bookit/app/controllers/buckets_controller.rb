class BucketsController < ApplicationController
		before_filter :load_bucket, :except => [:index, :home, :create, :show_archive]

	def index
		@buckets = Bucket.where(archive: false, privacy: "public")
	end

	def home
		@buckets = current_user.owned_buckets.where(archive: false)
	end

	def show
		@items = @bucket.items.order(status: :desc)
		@item = Item.new
		@hashtags = ""
		@bucket.hashtags.each {|x| @hashtags << "##{x.tag} " }
	end

	def create
		@new_bucket = current_user.created_buckets.create(bucket_params)
		redirect_to bucket_update_hashtags_path(@new_bucket, :hashtags => params[:bucket][:hashtags][:tag])
	end

	def destroy
		bucket.destroy
		redirect_to buckets_home_path
	end

	def update
		@bucket.update(bucket_params)
		redirect_to bucket_update_hashtags_path(@bucket, :hashtags => params[:bucket][:hashtags][:tag])
	end

	def archive
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

  def load_bucket
    @bucket = Bucket.find params[:id]
  end
end


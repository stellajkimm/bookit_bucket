class BucketsController < ApplicationController
		before_filter :load_bucket, only: [:show, :destroy, :update, :archive] #, :photo]
		before_filter :load_new_bucket

	def index
		@buckets = Bucket.where(archive: false).where.not(privacy: "private")
		@number_of_buckets = @buckets.size
	end

	def home
		@buckets = current_user.owned_buckets.where(archive: false)
		@followed_buckets = current_user.followed_buckets
		@number_of_buckets = @buckets.size + @followed_buckets.size
		@type_of_bucket = "all"
	end

	def show
		@items = @bucket.items.order(status: :desc)
		@item = Item.new
		@hashtags = ""
		@bucket.hashtags.each {|x| @hashtags << "##{x.tag} " }

		@bucket_ownership = @bucket.bucket_ownerships.new
		# still haven't implemented friends yet so this will change
		@users_array = User.all - @bucket.owners
	end

	def create
		@new_bucket = current_user.created_buckets.create(bucket_params)
		
		categories = ["restaurants", "dates", "friends", "things_to_buy", "things_to_do", "before_i_die", "places_to_visit", "activities"]
		@new_bucket.image = 'assets/' + categories.sample + '/' + rand(1..10).to_s + '.jpg'
		redirect_to bucket_update_hashtags_path(@new_bucket, :hashtags => params[:bucket][:hashtags][:tag])
	end

	def destroy
		@bucket.destroy
		redirect_to buckets_home_path
	end

	def update
		@bucket.update(bucket_params)
		redirect_to bucket_update_hashtags_path(@bucket, :hashtags => params[:bucket][:hashtags][:tag])
	end

	# def photo
	# 	p "***********"
	# 	p @bucket
	# 	p "***********"
	# 	@bucket.image = params[:bucket][:remote_image_url]
	# 	p "params:  " + params[:bucket][:remote_image_url]
	# 	p @bucket.image
	# 	p "***********"
	# 	@bucket.save
	# 	redirect_to bucket_path(@bucket)
	# end

	def archive
		@bucket.archive == false ? @bucket.update(archive: true) : @bucket.update(archive: false)
		redirect_to bucket_show_archive_path
	end

	def show_archive
		@buckets = current_user.owned_buckets.where(archive: true)
		@number_of_buckets = @buckets.size
		@type_of_bucket = "archive"
		render 'home'
	end

	def show_public
		@buckets = current_user.owned_buckets.where(archive: false, privacy: "public")
		@number_of_buckets = @buckets.size
		@type_of_bucket = "public"
		render 'home'
	end

	def show_private
		@buckets = current_user.owned_buckets.where(archive: false, privacy: "private")
		@number_of_buckets = @buckets.size
		@type_of_bucket = "private"
		render 'home'
	end

	def show_group
		@buckets = current_user.owned_buckets.joins(:bucket_ownerships).group("buckets.id").having("count(bucket_ownerships.id) > ?", 1)
		@number_of_buckets = @buckets.length
		@type_of_bucket = "group"
		render 'home'
	end

	def show_following
		# this code is show_group code. it is wrong and you need to update this.
		@buckets = current_user.followed_buckets.where(archive: false)
		@number_of_buckets = @buckets.size
		@type_of_bucket = "following"
		render 'home'
	end

	private
  
  def bucket_params
    params.require(:bucket).permit(:name, :privacy, :user_id, :archive, :image, :remote_image_url)
  end

  def load_bucket
    @bucket = Bucket.find params[:id]
    @bucket_following = @bucket.bucket_followings.new
  end

  def load_new_bucket
  	@new_bucket = Bucket.new
  end
end


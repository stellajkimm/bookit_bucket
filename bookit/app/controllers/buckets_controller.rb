class BucketsController < ApplicationController
	def index
		@buckets = Bucket.all
	end

	def home
		@buckets = current_user.owned_buckets
	end

	def show
		@bucket = Bucket.find(params[:id])
		@items = @bucket.items
		@item = Item.new
	end
end


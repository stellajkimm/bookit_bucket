class BucketsController < ApplicationController
	def index
		@buckets = Bucket.all
	end
end


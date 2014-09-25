class HashtagsController < ApplicationController
	def show
		@hashtag = Hashtag.find(params[:id])
	end

	def update
		@bucket = Bucket.find(params[:bucket_id])
		hashtags = params[:hashtags]
		hashtags_array = hashtags.split("#")
		hashtags_array.each do |tag|
			tag.strip!
			@bucket.hashtags << Hashtag.find_or_create_by(tag: tag) if tag.length > 0 && !@bucket.hashtags.include?(Hashtag.find_by(tag: tag))
		end

		@bucket.hashtags.each do |tag|
			@bucket.bucket_hashtags.find_by(hashtag_id: tag.id).delete if !hashtags_array.include?(tag.tag)
		end
		redirect_to bucket_path(@bucket)
	end

	def search
    # @hashtag = Hashtag.find(params[:id])
    # @buckets = Buckets.all
  end

end

class HashtagsController < ApplicationController
	def show
		@hashtag = Hashtag.find(params[:id])
	end

	def update
		@bucket = Bucket.find(params[:bucket_id])
		hashtags = params[:hashtags]
		hashtags_array = hashtags.split("#")
		hashtags_array.each do |tag|
			@bucket.hashtags << Hashtag.find_or_create_by(tag: tag.strip) if tag.length > 0
		end

		redirect_to bucket_path(@bucket)
	end
end

module BucketHelper
	def short_list(bucket_id)
		bucket = Bucket.find(bucket_id)
		items = bucket.items.limit(5)
	end
end

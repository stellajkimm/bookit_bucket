class BucketHashtag < ActiveRecord::Base
  belongs_to :bucket
	belongs_to :hashtag
end

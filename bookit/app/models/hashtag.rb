class Hashtag < ActiveRecord::Base
	has_many :bucket_hashtags
	has_many :buckets, through: :bucket_hashtags

	validates :tag, uniqueness: true
end

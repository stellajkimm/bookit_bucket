class Bucket < ActiveRecord::Base
  after_create :make_ownership

  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :bucket_hashtags
  has_many :hashtags, through: :bucket_hashtags
  has_many :bucket_ownerships
  has_many :owners, through: :bucket_ownerships, source: :user
  has_many :bucket_followings
  has_many :followers, through: :bucket_followings, source: :user
  has_many :items

  mount_uploader :image, ImageUploader

  def make_ownership
  	bucket = Bucket.last
  	bucket.bucket_ownerships.create(user_id: bucket.user_id)
  end
end

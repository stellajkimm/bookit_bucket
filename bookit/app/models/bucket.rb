class Bucket < ActiveRecord::Base
  after_create :make_ownership

  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :bucketownerships
  has_many :owners, through: :bucketownerships, source: :user
  has_many :items

  def make_ownership
  	bucket = Bucket.last
  	bucket.bucketownerships.create(user_id: bucket.user_id)
  end
end

class Bucket < ActiveRecord::Base
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :bucketownerships
  has_many :owners, through: :bucketownerships, source: :user
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_secure_password
  acts_as_follower
  acts_as_followable

  has_many :bucket_ownerships
  has_many :owned_buckets, through: :bucket_ownerships, source: :bucket
  has_many :created_buckets, class_name: "Bucket", foreign_key: :user_id
  has_many :attendances
  has_many :attending_items, through: :attendances, source: :item

  validates_presence_of :email
  validates :email, uniqueness: true
  validates :email, format: {with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,}/}

  def full_name
    "#{first_name} #{last_name}"
  end
end

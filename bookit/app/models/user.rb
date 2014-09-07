class User < ActiveRecord::Base
  has_secure_password
  acts_as_follower
  acts_as_followable

end

class Bucketownership < ActiveRecord::Base
  belongs_to :user
  belongs_to :bucket
end

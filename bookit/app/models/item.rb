class Item < ActiveRecord::Base
  belongs_to :bucket
  has_many :attendances
  has_many :attending_users, through: :attendances, source: :user
  
end

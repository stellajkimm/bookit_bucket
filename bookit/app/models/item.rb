class Item < ActiveRecord::Base
  belongs_to :bucket
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  
end

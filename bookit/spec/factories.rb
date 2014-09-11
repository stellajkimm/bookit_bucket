FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
  end

  factory :bucket do
  	name { Faker::Commerce.product_name }
  	privacy { "private" }
  	category_id { "1" }
  	user_id { "1"}
  end
end
FactoryGirl.define do
  factory :hashtag do
    tag { Faker::Commerce.department}
  end

  # bucket factory with a `belongs_to` association for the user
  factory :bucket do
    name { Faker::Commerce.product_name }
    privacy { "public" }
    association :creator, factory: :user
  end

  # user factory without associated buckets
  factory :user do
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    password "password"

    # user_with_buckets will create bucket data after the user has been created
    factory :user_with_buckets do
      # buckets_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        buckets_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the bucket
      after(:create) do |user, evaluator|
        create_list(:bucket, evaluator.buckets_count, creator: user)
      end
    end
  end
end
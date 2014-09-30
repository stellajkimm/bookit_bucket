class CreateBucketFollowings < ActiveRecord::Migration
  def change
    create_table :bucket_followings do |t|
    	t.references :bucket, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end

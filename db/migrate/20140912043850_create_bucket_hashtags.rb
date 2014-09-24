class CreateBucketHashtags < ActiveRecord::Migration
  def change
    create_table :bucket_hashtags do |t|
      t.references :bucket, index: true
      t.references :hashtag, index: true

      t.timestamps
    end
  end
end

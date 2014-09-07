class CreateBucketownerships < ActiveRecord::Migration
  def change
    create_table :bucketownerships do |t|
      t.references :user, index: true
      t.references :bucket, index: true

      t.timestamps
    end
  end
end

class CreateBucketOwnerships < ActiveRecord::Migration
  def change
    create_table :bucket_ownerships do |t|
      t.references :user, index: true
      t.references :bucket, index: true

      t.timestamps
    end
  end
end

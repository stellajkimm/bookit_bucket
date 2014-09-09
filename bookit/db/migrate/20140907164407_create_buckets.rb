class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :name
      t.string :privacy
      t.references :category, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

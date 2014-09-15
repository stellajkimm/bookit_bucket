class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :name
      t.string :privacy
      t.references :user, index: true
      t.string :archive, default: false

      t.timestamps
    end
  end
end

class AddImageToBuckets < ActiveRecord::Migration
  def change
    add_column :buckets, :image, :string
  end
end

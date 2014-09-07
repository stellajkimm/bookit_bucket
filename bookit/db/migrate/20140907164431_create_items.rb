class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.references :bucket, index: true
      t.string :notes

      t.timestamps
    end
  end
end

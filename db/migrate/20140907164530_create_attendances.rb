class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :item, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

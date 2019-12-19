class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disk_id
      t.string :song_title, index: true
      t.integer :song_order
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

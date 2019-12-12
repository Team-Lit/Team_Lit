class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.integer :product_id
      t.string :artist_name, index: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

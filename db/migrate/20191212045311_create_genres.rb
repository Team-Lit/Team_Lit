class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :product_id
      t.string :genre_name, index: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name, index: true
      t.text :jacket_image_id
      t.integer :artist_id
      t.integer :label_id
      t.integer :genre_id
      t.integer :disk_id
      t.integer :stock_status, index: true, default: 0
      t.integer :pre_tax_price
      t.string :release_date
      t.integer :stock_quantity
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

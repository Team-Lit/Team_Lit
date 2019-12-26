class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :product_id
      t.string :arrival_date
      t.integer :arrival_quantity
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

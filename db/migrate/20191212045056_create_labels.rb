class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.integer :product_id
      t.string :label_name, index: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

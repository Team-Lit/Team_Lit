class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
      t.integer :product_id
      t.string :disk_numbre
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

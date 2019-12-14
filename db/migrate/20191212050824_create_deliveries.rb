class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :public_id
      t.string :zip
      t.text :address
      t.string :address_name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

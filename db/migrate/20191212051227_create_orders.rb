class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :end_user_id
      t.integer :tax_rate
      t.integer :delivery_charge
      t.integer :total_price
      t.integer :delivery_status, index: true
      t.integer :payment_method
      t.text :address
      t.string :address_name
      t.string :zip
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

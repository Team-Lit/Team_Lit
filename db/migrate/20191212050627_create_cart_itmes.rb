class CreateCartItmes < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_itmes do |t|
      t.integer :product_id
      t.integer :public_id
      t.integer :quantity

      t.timestamps
    end
  end
end

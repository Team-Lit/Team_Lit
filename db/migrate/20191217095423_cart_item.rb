class CartItem < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :public_id
      t.integer :quantity
    end
  end
end

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :public_id
      t.integer :product_id

      t.timestamps
    end
  end
end

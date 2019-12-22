class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.integer :charge, default: 500
      t.float :tax_rate, default: 1.1

      t.timestamps
    end
  end
end

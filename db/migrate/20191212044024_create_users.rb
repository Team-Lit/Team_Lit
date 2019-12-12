class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :end_user_last_name, index: true
      t.string :end_user_first_name, index: true
      t.string :end_user_last_kana, index: true
      t.string :end_user_first_kana, index: true
      t.string :zip
      t.text :address
      t.string :end_user_phone
      t.string :end_user_email
      t.string :end_user_password
      t.datetime :unsubscribe

      t.timestamps
    end
  end
end

class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :admin_email
      t.string :admin_password

      t.timestamps
    end
  end
end

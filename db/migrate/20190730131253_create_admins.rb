class CreateAdmins < ActiveRecord::Migration[5.2]
  def change

    create_table(:admins) do |t|
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :name
      t.string :image
      t.boolean :super_admin, default: false
      t.string :email, null: false
      t.json :tokens

      t.timestamps
    end

    add_index :admins, :email,                unique: true
    add_index :admins, :reset_password_token, unique: true

  end
end

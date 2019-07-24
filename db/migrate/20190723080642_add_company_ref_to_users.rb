class AddCompanyRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :company,            index: true
    remove_index "users", name: "index_users_on_email"

    add_index :users, [:email, :company_id],  unique: true
  end
end

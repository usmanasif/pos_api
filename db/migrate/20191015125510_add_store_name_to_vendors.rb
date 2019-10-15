class AddStoreNameToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :store_name, :string
  end
end

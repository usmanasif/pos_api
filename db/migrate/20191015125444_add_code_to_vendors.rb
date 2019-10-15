class AddCodeToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :code, :string
  end
end

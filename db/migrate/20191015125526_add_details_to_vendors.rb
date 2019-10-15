class AddDetailsToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :details, :string
  end
end

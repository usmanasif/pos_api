class AddVendorIdToLedgers < ActiveRecord::Migration[5.2]
  def change
    add_column :ledgers, :vendor_id, :bigint
  end
end

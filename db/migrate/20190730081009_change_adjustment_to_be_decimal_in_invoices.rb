class ChangeAdjustmentToBeDecimalInInvoices < ActiveRecord::Migration[5.2]
 def change
    remove_column :invoices, :adjustment
    add_column :invoices, :adjustment, :decimal
  end
end

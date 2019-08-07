class AddDiscountToInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :discount_id, :bigint
  end
end

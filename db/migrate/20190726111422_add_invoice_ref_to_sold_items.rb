class AddInvoiceRefToSoldItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :sold_items, :invoice, foreign_key: true
  end
end

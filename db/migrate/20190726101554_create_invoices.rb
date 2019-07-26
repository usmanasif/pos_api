class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.json :discount
      t.json :adjustment
      t.decimal :total

      t.timestamps
    end
  end
end

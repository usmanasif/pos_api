class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.json :discount
      t.decimal :adjustment
      t.decimal :total
      t.bigint :creator_id
      t.foreign_key :users, column: "creator_id"

      t.timestamps
    end
  end
end

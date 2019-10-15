class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :debit
      t.integer :credit
      t.string :details
      t.datetime :transaction_date
      t.integer :ledger_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end

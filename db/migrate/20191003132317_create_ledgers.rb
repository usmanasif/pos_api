class CreateLedgers < ActiveRecord::Migration[5.2]
  def change
    create_table :ledgers do |t|
      t.integer :total_amount
      t.integer :due_amount
      t.string :account_type
      t.string :category

      t.timestamps
    end
  end
end

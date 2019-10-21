class RemoveDebitFromTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :debit, :integer
  end
end

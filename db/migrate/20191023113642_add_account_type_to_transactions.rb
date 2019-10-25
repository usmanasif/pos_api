class AddAccountTypeToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :account_type, :string
  end
end

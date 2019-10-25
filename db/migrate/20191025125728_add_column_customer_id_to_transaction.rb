class AddColumnCustomerIdToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :customer_id, :string
  end
end

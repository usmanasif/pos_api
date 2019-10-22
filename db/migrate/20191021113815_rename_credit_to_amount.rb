class RenameCreditToAmount < ActiveRecord::Migration[5.2]
  def change
  	rename_column :transactions, :credit, :amount
  end
end

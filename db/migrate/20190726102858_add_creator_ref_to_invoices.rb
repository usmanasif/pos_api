class AddCreatorRefToInvoices < ActiveRecord::Migration[5.2]
  def change
  	add_column :invoices, :creator_id, :bigint , index: true
		add_foreign_key :invoices, :users, column: :creator_id
  end
end

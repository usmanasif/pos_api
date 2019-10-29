class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :price
      t.integer :quantity
      t.string :details
      t.integer :vendor_id
      t.integer :customer_id

      t.timestamps
    end
  end
end

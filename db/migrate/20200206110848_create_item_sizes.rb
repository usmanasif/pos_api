class CreateItemSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_sizes do |t|
      t.references :item, foreign_key: true
      t.references :size, foreign_key: true
      t.float :price
      t.string :code
      t.integer :quantity
      t.integer :discount

      t.timestamps
    end
  end
end

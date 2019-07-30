class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :code
      t.integer :current_stock
      t.float :sale_price

      t.timestamps
    end
  end
end

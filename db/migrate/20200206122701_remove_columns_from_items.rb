class RemoveColumnsFromItems < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :code
    remove_column :items, :current_stock
    remove_column :items, :sale_price
    remove_column :items, :discount
  end

  def down
    add_column :items, :discount, :integer
    add_column :items, :sale_price, :float
    add_column :items, :current_stock, :integer
    add_column :items, :code, :string
  end
end

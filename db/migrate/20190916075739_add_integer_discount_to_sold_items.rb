class AddIntegerDiscountToSoldItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_items, :discount, :integer, default: 0
  end
end

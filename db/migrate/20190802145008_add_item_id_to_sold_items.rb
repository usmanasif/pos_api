class AddItemIdToSoldItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_items, :item_id, :bigint
  end
end

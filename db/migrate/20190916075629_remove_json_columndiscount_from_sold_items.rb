class RemoveJsonColumndiscountFromSoldItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :sold_items, :discount
  end
end

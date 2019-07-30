class CreateSoldItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sold_items do |t|
      t.decimal :unit_price
      t.decimal :quantity
      t.json :discount

      t.timestamps
    end
  end
end

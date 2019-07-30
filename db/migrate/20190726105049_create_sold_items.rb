class CreateSoldItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sold_items do |t|
      t.decimal :unit_price
      t.decimal :quantity
      t.json :discount
      t.references(:invoice, foreign_key: true)

      t.timestamps
    end
  end
end

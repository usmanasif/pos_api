class ChangePriceToBeIntegerInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :integer, using: 'price::integer'
  end
end

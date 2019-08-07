class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.float :rate
      t.string :detail

      t.timestamps
    end
  end
end

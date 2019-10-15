class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end

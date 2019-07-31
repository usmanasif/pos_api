class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :ancestry, index: true
      t.timestamps
    end
    add_reference :items, :category, index: true
  end
end
class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :subdomain
      t.string :logo
      t.json :about_you

      t.timestamps
    end
  end
end

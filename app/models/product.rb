class Product < ApplicationRecord
	belongs_to :vendor, optional: true
  	validates :name, :code, :price, :quantity, presence: true  

end

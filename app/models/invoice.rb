class Invoice < ApplicationRecord
	belongs_to :creator, class_name: "User"
	has_many :sold_items

	accepts_nested_attributes_for :sold_items
	
end

class Invoice < ApplicationRecord
	belongs_to :creator, class_name: "User"
	has_many :sold_items
  after_create :update_item_quantities

	accepts_nested_attributes_for :sold_items

  def update_item_quantities
    self.sold_items.each do |sold_item|
      sold_quantity = sold_item.quantity
      item = sold_item.item
      item.update_columns(current_stock: (item.current_stock - sold_quantity))
    end
  end

end

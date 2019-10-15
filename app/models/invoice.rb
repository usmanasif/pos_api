class Invoice < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :sold_items, dependent: :destroy
  belongs_to :discount, optional: true
  after_create :update_item_quantities
  after_update :update_item_quantities

  accepts_nested_attributes_for :sold_items

  enum status: [:drafted, :completed]

  def update_item_quantities
    if self.completed?
      self.sold_items.each do |sold_item|
        sold_quantity = sold_item.quantity
        item = sold_item.item
        new_quantity = item.current_stock - sold_quantity
        raise Exception.new("#{item.name} capacity exceeded, remaining capacity is #{item.current_stock}") if new_quantity < 0
        item.update_columns(current_stock: (new_quantity))
      end
    end
  end

  scope :today, -> {where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)}
end

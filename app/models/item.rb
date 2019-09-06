class Item < ApplicationRecord
  validates_presence_of :name, :code, :sale_price, :current_stock

  belongs_to :category
  has_many :sold_items
end

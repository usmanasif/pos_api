class Item < ApplicationRecord
  validates_presence_of :name, :code, :sale_price, :current_stock
end

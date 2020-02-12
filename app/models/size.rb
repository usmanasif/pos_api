class Size < ApplicationRecord
  has_many :item_sizes
  has_many :items, through: :item_sizes, dependent: :destroy

  validates :size_type, presence: true
end

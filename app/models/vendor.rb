class Vendor < ApplicationRecord
  has_one :ledger
  has_many :transactions
  has_many :products
  validates :name, :phone_number, :address, :code, :store_name, presence: true  
end	
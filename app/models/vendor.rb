class Vendor < ApplicationRecord
  has_one :ledger
  has_many :transactions
  validates :name, :phone_number, :address, :code, :store_name, presence: true  
end	
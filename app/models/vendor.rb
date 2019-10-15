class Vendor < ApplicationRecord
  has_one :ledger
  has_many :transections
  validates :name, :phone_number, :address, :code, :store_name, presence: true  
end	
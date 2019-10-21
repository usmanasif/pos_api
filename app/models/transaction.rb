class Transaction < ApplicationRecord
  belongs_to :vendor
  validates :amount, :vendor_id, :transaction_date, :transaction_code, :details, presence: true
  validates :transaction_code, uniqueness: true
end
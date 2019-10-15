class Transaction < ApplicationRecord
  validates :debit, :credit, :details, presence: true
end
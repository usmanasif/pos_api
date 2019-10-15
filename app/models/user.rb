class User < ApplicationRecord
  has_many :invoices, foreign_key: 'creator_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:read_and_write, :read_only]

  include DeviseTokenAuth::Concerns::User
end

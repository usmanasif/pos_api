class User < ApplicationRecord

	has_many :invoices, foreign_key: 'creator_id'

  # Include default devise modules. Others available are:
  #  :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 include DeviseTokenAuth::Concerns::User
end

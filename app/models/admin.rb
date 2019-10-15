class Admin < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User
end

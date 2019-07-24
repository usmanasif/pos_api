class Company < ApplicationRecord
  has_many :users
  validates :subdomain, :name, presence: true

  after_create :create_tenant
  after_destroy :drop_tenant

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def drop_tenant
    Apartment::Tenant.drop(subdomain)
  end
end

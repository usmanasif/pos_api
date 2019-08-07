class Company < ApplicationRecord
  validates :subdomain, :name, presence: true

  after_create :create_tenant
  after_destroy :drop_tenant

  self.per_page = 5

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def drop_tenant
    Apartment::Tenant.drop(subdomain)
  end
end

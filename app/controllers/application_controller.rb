class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :set_current_company

  protected

  def set_current_company
    @current_company = Company.find_by(subdomain: Apartment::Tenant.current)
  end
end

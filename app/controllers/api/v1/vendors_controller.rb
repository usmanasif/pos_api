class Api::V1::VendorsController < ApplicationController
  before_action :get_vendor, only:[:destroy, :update]

  def index
    render json: Vendor.all
  end

  def create
    vendor = Vendor.new(vendor_params)
    if vendor.save
      render json: 'Vendor created successfully', status: :created
    else
      render json: 'Something went wrong! pleasse try again', status: :unprocessable_entity
    end
  end

  def update
    @vendor.update(vendor_params)
  end

  def destroy
    @vendor.destroy!
  end

  private

  def get_vendor
    @vendor = Vendor.find(params[:id])
  end

  def vendor_params
    params.permit(:code, :name, :store_name, :phone_number, :address)
  end
end

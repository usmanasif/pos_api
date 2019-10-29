class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_product, only:[:destroy, :update]

  def index
    render json: all_products
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: 'Product created successfully', status: :created
    else
      render json: 'Something went wrong! pleasse try again', status: :unprocessable_entity
    end
  end

  def update
    @product.update(product_params)
  end

  def destroy
    @product.destroy!
  end

  private

  def get_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.permit(:code, :name, :quantity, :price, :details, :vendor_id, :customer_id)
  end

  def all_products
    collection = ProductsCollection.new(params)
    collection.meta
  end
end


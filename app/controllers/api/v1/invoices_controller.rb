class Api::V1::InvoicesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_invoice, only: [:show]

  def index
    render json: all_invoices
  end

  def show
    render json:(@invoice.attributes.merge("sold_items":@invoice.sold_items.map{|sold_item| sold_item.attributes.merge("item_name": sold_item.item.name)},"creator_name": @invoice.creator.email,"discount": @invoice.discount))
  end

  def create
    @invoice = current_user.invoices.new(invoice_params)
    if @invoice.save
      render json:"invoice created successfully", status: :created
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end

  end

  private

    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def all_invoices
      SoldItem.joins(:invoice)
    end

    def invoice_params
      params.require(:invoice).permit(:total, :adjustment, :discount_id, sold_items_attributes: [:item_id, :unit_price,:quantity, :discount])
    end
end

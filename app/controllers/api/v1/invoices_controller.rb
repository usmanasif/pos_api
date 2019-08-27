class Api::V1::InvoicesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_invoice, only: [:show]

  def index
    render json: all_invoices
  end

  def show
    render json: (@invoice.attributes.merge("sold_items":@invoice.sold_items.joins(:item).select('sold_items.*,items.name'),"discount": @invoice.discount))
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
      @invoice = Invoice.joins(:creator).select("invoices.*,users.email as creator_name").find_by("invoices.id=?",params[:id])
    end
    def all_invoices
      collection = InvoicesCollection.new(params)
      collection.meta
    end

    def invoice_params
      params.require(:invoice).permit(:total, :adjustment, :discount_id, sold_items_attributes: [:item_id, :unit_price,:quantity, :discount])
    end
end

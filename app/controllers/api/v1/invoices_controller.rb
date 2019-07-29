class Api::V1::InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show]
  before_action :all_invoices, only:[:index]
  
  # GET /invoices
  def index 
    render json: @invoices 
  end

  # GET /invoices/1
  def show
    render json:(@invoice.attributes.merge("sold_items":@invoice.sold_items))
  end

  # POST /invoices
  def create
    u = User.first
    @invoice = u.invoices.new(invoice_params)
    if @invoice.save
      render json:"invoice created successfully", status: :created
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def all_invoices 
      @invoices = []
      Invoice.all.each do |i| 
        @invoices << i.attributes.merge("sold_items":i.sold_items)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def invoice_params
      params.require(:invoice).permit(:total, discount:[:discount,:discount_reason],adjustment:[:adjustment,:adjustment_reason] , sold_items_attributes: [:unit_price,:quantity,discount:[:discount,:discount_reason]])
    end
end

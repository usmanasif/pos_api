class Api::V1::InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:show]
  before_action :all_invoices, only:[:index]
  
  def index 
    render json: @invoices 
  end

  def show
    render json:(@invoice.attributes.merge("sold_items":@invoice.sold_items))
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
      @invoices = []
      Invoice.all.each do |i| 
        @invoices << i.attributes.merge("sold_items":i.sold_items)
      end
    end

    def invoice_params
      params.require(:invoice).permit(:total, discount:[:discount,:discount_reason],adjustment:[:adjustment,:adjustment_reason] , sold_items_attributes: [:unit_price,:quantity,discount:[:discount,:discount_reason]])
    end
end

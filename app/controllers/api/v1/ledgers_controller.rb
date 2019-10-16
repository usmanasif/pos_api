class Api::V1::LedgersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_ledger, only:[:update]

  def index
    render json: all_ledgers
  end

  def create
    ledger = Ledger.new(ledger_params)
    if ledger.save
      render json: "Ledger created successfully!", status: :created
    else
      render json: "something went wrong, please try again", status: :unprocessable_entity 
    end
  end

  def update
    @ledger.update(ledger_params)
  end

  private

  def get_ledger
    @ledger = Ledger.find(params[:id])
  end

  def ledger_params
    params.permit(:total_amount, :due_amount, :account_type, :category, :vendor_id)
  end

  def all_ledgers
      collection = LedgersCollection.new(params)
      collection.meta
  end
end
class Api::V1::TransactionsController < ApplicationController
  before_action :get_transaction, only:[:destroy, :update]

  def index
    render json: Transaction.all
  end

  def create
    transaction = Transaction.new(transaction_params)
    if transaction.save
      render json: 'Transaction created successfully', status: :created
    else
      render json: 'Something went wrong! pleasse try again', status: :unprocessable_entity
    end
  end

  def update
    @transaction.update(transaction_params)
  end

  def destroy
    @transaction.destroy!
  end

  private

  def get_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.permit(:debit, :credit, :details, :transaction_date, :vendor_id, :ledger_id)
  end
end

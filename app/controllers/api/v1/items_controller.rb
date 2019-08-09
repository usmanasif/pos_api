class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Item.all, :include => {:category => {:only => [:name, :id]}}
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json:"Item created successfully", status: :created
    else
      render json: 'Something went wrong! Please try again', status: :unprocessable_entity
    end
  end

  def destroy
    Item.find(params[:id]).destroy!
  end

  private
  def item_params
    params.permit(:name, :category_id, :code, :current_stock, :sale_price)
  end

end

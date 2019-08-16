class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:update, :destroy]
  before_action :get_items, only: [:index]

  def index
    render json: [ { total: Item.count}, JSON.parse(@items.paginate(page: params[:page], 
                     per_page: params[:per_page]).to_json(include: {category: {only: [:name, :id]}})) ]
  end

  def update
    @item.update(item_params)
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
    @item.destroy!
  end

  private
  def get_items
    if params[:category_id]
      @items = Item.where(category_id: params[:category_id])
    else
      @items = Item.all
    end
  end

  def item_params
    params.permit(:name, :category_id, :code, :current_stock, :sale_price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

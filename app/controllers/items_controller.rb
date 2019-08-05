class ItemsController < ApplicationController
  def index
    render json: Item.where.not(current_stock: 0)
  end

end

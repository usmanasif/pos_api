class Api::V1::DiscountsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Discount.all
  end
end

class Api::V1::SizesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Size.all
  end
end

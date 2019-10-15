class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category, only: [:destroy]
  
  def index 
    render json: Category.json_tree(Category.arrange) 
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json:"Category created successfully", status: :created
    else
      render json: 'Something went wrong, please make sure the category name is unique', status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end

  private
  
  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.permit(:name, :parent_id)
  end
end

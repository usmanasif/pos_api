class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    render json: Category.json_tree(Category.arrange) 
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json:"invoice created successfully", status: :created
    else
      render json: 'Something went wrong, please make sure the category name is unique', status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
  
end
